import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;

import '../../core.dart';

class ApiService {
  static final dio.Dio _dio = dio.Dio();

  static Future<dynamic> get({
    required String endpoint,
    String? token,
    dynamic queryParameters,
  }) async {
    String url = _buildUrl(endpoint);
    _logRequest(url, token, queryParameters);

    try {
      var response = await _dio.get(
        url,
        options: _createOptions(token),
        queryParameters: queryParameters,
      );
      _logResponse(url, response);
      return _processResponse(response: response, token: token);
    } on SocketException {
      throw FetchDataException(
        message: "No Internet connection!",
        url: url,
      );
    } on TimeoutException {
      throw ApiNotRespondingException(
        message: 'API not responded in time!',
        url: url,
      );
    }
  }

  static Future<dynamic> post({
    required String endpoint,
    String? token,
    dynamic payload,
  }) async {
    String url = _buildUrl(endpoint);
    _logRequest(url, token, payload);

    try {
      var response = await _dio.post(
        url,
        options: _createOptions(token),
        queryParameters: payload,
      );
      _logResponse(url, response);
      Log.logger.e(response);
      return response.data;
    } catch (e) {
      _handleError(e);
      throw AppException(
          message: 'Failed to perform POST request: $e', url: url, prefix: '');
    }
  }

  static dio.Options? _createOptions(String? token) {
    if (token != null) {
      return dio.Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
    }
    return null;
  }

  static String _buildUrl(
    String endpoint,
  ) {
    return ConstantStrings.baseUrl + endpoint;
  }

  static void _logRequest(String url, String? token, dynamic data) {
    print('Sending request to: $url');
    if (token != null) {
      print('User Token: $token');
    }
    if (data != null) {
      Log.logger.d('Request Data: $data');
    }
  }

  static void _logResponse(String url, dio.Response response) {
    print('HTTP Method: ${response.requestOptions.method}');
    print('Response Status Code: ${response.statusCode}');
    print('URL: $url');
    Log.logger.d('Response Data: ${jsonEncode(response.data)}');
  }

  static void _handleError(dynamic e) {
    print('Error: $e');
    // Methods.showSnackbar(msg: ConstantStrings.wentWrong);
    Log.logger.e('Error: $e');
  }

  static dynamic _processResponse(
      {required dio.Response response, String? token}) {
    Log.logger.e(response.statusCode);
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException(
          message: response.data.toString(),
          url: response.requestOptions.uri.toString(),
        );
      default:
        throw FetchDataException(
          message: 'Error occurred with code: ${response.statusCode}',
          url: response.requestOptions.uri.toString(),
        );
    }
  }
}

// class ApiException implements Exception {
//   final String message;
//
//   ApiException(this.message);
//
//   @override
//   String toString() => 'ApiException: $message';
// }
