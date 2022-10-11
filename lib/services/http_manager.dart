import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as Get;

import '../models/custom_response.dart';
import '../pages_routes/app_pages.dart';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
}

class HttpManager {
  Future<CustomResponse> restRequest(
      {required String url, required method, Map? headers, Map? body,}) async {
    Dio dio = Dio();
    dio.interceptors.add(AppInterceptors());
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'Content-type': 'application/json',
        // 'x-access-token':  token;
      });
    try {
      Response response = await dio.request(url,
          options: Options(method: method, headers: defaultHeaders), data: body);
      return CustomResponse(statusCode: response.statusCode, data: response.data);
    } on DioError catch (error) {
      return CustomResponse(statusCode: error.response!.statusCode, error: error.response!.data['message']);
    } catch (error) {
      return CustomResponse(statusCode: 500, error: 'Ocorreu um erro');
    }
  }
}

class AppInterceptors extends Interceptor {

 @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
   if(err.response!.statusCode == 401) {
      Get.Get.offNamed(PagesRoutes.signInRoute);
   }
    return handler.next(err);
  }
}
