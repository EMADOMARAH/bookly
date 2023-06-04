import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioError e)
  {
    switch(e.type){

      case DioErrorType.connectionTimeout:
        return ServerFailure("Connection timeout");
      case DioErrorType.sendTimeout:
        return ServerFailure("send timeout");
      case DioErrorType.receiveTimeout:
        return ServerFailure("receive timeout");
      case DioErrorType.badCertificate:
        return ServerFailure("Bad Certificate");
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode, e.response!.data);
      case DioErrorType.cancel:
        return ServerFailure("Request or ApiServer was canceled");
      case DioErrorType.connectionError:
        return ServerFailure("No Internet Connection");
      case DioErrorType.unknown:
        return ServerFailure("Opps there was an Error, PLease try again");
    }
  }

  factory ServerFailure.fromResponse(int? statusCode , dynamic response)
  {
    if (statusCode == 404) {
      return ServerFailure("Your request was not found , please try later");
    }else if (statusCode == 500) {
      return ServerFailure("THere is a problem with server, please try later");
    }else if (statusCode == 400 ||statusCode == 401 ||statusCode == 403) {
      return ServerFailure(response['error']['message']);
    }else{
      return ServerFailure("there was an error, please try again");
    }
  }
}

