//Dio powerful Http client for Dart,
//which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc
import 'package:dio/dio.dart';

class DioService {
  //? make the variable nullable
  Dio? _dio; //creating a private object of Dio class
  final baseUrl = "https://reqres.in/";

//TODO:Declaring a Constructor of Dio Class
  DioService() {
    _dio = Dio(
      //todo: passing base option
      BaseOptions(baseUrl: baseUrl, connectTimeout: 5000, receiveTimeout: 5000),
      //headers: {HttpHeaders.userAgentHeader: 'dio', 'common-header': 'xx'},
    );
    initializeInterceptors();
  } //DioService
  //TODO: Making a future/method for get request it will return a response package for dio
  Future<Response?> getRequest(String endPoint) async {
    Response? response; // create response type object
    try {
      response = await _dio?.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  //todo:will initialize intercptors here ..interceptors help to easily  debug api response
  initializeInterceptors() {
    _dio?.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));
    _dio?.interceptors.add(LogInterceptor(
        requestBody: true, responseBody: true, requestHeader: true));
  }
}
