import 'package:dio/dio.dart' hide Headers;

class ServerError implements Exception {
  int _errorCode;
  String _errorMessage = "";

  ServerError.withError({DioError error}) {
    _handleError(error);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError( DioError error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        // TODO: Handle this case.
        _errorMessage = "Connection timeout";
        break;
      case DioExceptionType.sendTimeout:
        // TODO: Handle this case.
        _errorMessage = "Receive timeout in send request";
        break;
      case DioExceptionType.receiveTimeout:
        // TODO: Handle this case.
        _errorMessage = "Receive timeout in connection";
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioExceptionType.badResponse:
        // TODO: Handle this case.
        _errorMessage = "Connection failed due to internet connection";
        break;
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        _errorMessage = "Request was cancelled";
        break;
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        _errorMessage = "Received invalid status code: ${error.response.statusCode}";
        break;
      case DioExceptionType.unknown:
        // TODO: Handle this case.
        _errorMessage = "Received invalid status code: ${error.response.statusCode}";
        break;
    }
    return _errorMessage;
  }
}
