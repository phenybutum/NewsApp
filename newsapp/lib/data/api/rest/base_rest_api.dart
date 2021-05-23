import 'package:dio/dio.dart';
import 'package:newsapp/data/api/rest/interceptors/auth_interseptor.dart';

abstract class BaseRestApi {
  Dio dio;

  BaseRestApi(String baseApiEndPoint) {
    final options = BaseOptions(
      baseUrl: baseApiEndPoint,
      connectTimeout: 30000,
      receiveTimeout: 45000,
    );
    this.dio = Dio(options);
    this.dio.interceptors.add(AuthInterceptor());
  }

  String errorMessageFrom(DioError e, String fallbackMessage) {
    String message;
    if (e.response != null) {
      message = e.response.data.toString();
    } else {
      message = e.message;
    }
    return fallbackMessage + ' ' + message;
  }
}
