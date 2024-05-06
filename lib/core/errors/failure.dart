import 'package:dio/dio.dart';

abstract class Failure {
  final String error;

  Failure(this.error);
}

class ServerFailure extends Failure {
  ServerFailure(super.error);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('ConnectionTimeout , Please try later');
      case DioExceptionType.sendTimeout:
        return ServerFailure('SendTimeout , Please try later');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('ReceiveTimeout , Please try later');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate , Please try later');
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        (dioError.message!.contains('SocketException'));
        return ServerFailure('No Internet Connection');

      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
