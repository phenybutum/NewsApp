import 'package:dio/dio.dart';

const headerAuthToken = "Authorization";

class AuthInterceptor extends InterceptorsWrapper {
  String locale;

  AuthInterceptor();

  @override
  Future onRequest(RequestOptions options) async {
    try {
      options.headers['X-Api-Key'] = "bb86e1a5d6ea4dffa80ebbb4976e5a00";
      options.headers["Content-Type"] = "application/json";
      options.headers["Accept"] = "application/json";
    } catch (e) {
      print(e);
    }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    print("ERROR MSG[ ${err?.response?.data["message"]} ]");
    return super.onError(err);
  }
}
