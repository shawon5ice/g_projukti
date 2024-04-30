import 'dart:convert';

import 'package:dio/dio.dart';

import '../../core.dart';

class NetClient{
  static Future<dynamic> getData({
    String? token,
    required String api,
    dynamic parameter,
    String? apiVersion,
  }) async {
    // String apiV = apiVersion ?? ConstantStrings.kAPIVersion;
    // String url = ConstantStrings.kBaseUrl + apiV + api;
    String url = '${ConstantStrings.baseUrl}$api';

    print('Sending request to: $url');
    if (token != null) {
      print('User Token: $token');
    }
    if (parameter != null) {
      print("Parameter: $parameter");
    }
    try {
      var response = await Dio().get(
        url,
        options: token != null
            ? Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        )
            : null,
        queryParameters: parameter,
      );
      print('GET Method: ${response.statusCode}');
      print(url);
      Log.logger.e("GET Response:  ${jsonEncode(response.data)}");
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<dynamic> postData({
    required String api,
    String? token,
    dynamic body,
    String? apiVersion,
    bool? noDealer,
  }) async {
    // String apiV = apiVersion ?? ConstantStrings.kAPIVersion;
    // String url = ConstantStrings.kBaseUrl + apiV + api;
    String url = '${ConstantStrings.baseUrl}$api';

    print('Sending request to: $url');
    if (token != null) {
      print('User Token: $token');
    }
    if (body != null) {
      Log.logger.i("Post Body: $body");
    }
    try {
      var response = await Dio().post(
        url,
        options: token != null
            ? Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        )
            : null,
        data: body,
      );
      print('POST Method: ${response.statusCode}');
      print(url);
      Log.logger.e("POST Response:  ");
      Log.logger.e(jsonEncode(response.data));
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }
}