import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

abstract class ApiService extends DioForNative {
  ApiService({required String baseUrl}) : super() {
    options.baseUrl = baseUrl;
    assert(
      () {
        interceptors.add(LogInterceptor(requestHeader: false));
        return true;
      }(),
      'Dio Log Interceptor',
    );
  }
}

class ReqresInApiService extends ApiService {
  ReqresInApiService() : super(baseUrl: 'https://reqres.in/api');
}
