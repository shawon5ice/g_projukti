class AppException implements Exception {
  final String message;
  final String prefix;
  final String url;

  AppException({
    required this.message,
    required this.prefix,
    required this.url,
  });
}

class BadRequestException extends AppException {
  BadRequestException({
    required super.message,
    required super.url,
  }) : super(prefix: 'Bad Request');
}

class FetchDataException extends AppException {
  FetchDataException({
    required super.message,
    required super.url,
  }) : super(prefix: 'Unable to process');
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException({
    required super.message,
    required super.url,
  }) : super(prefix: 'Api not responded in time');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({
    required super.message,
    required super.url,
  }) : super(prefix: 'Unauthorized request');
}
