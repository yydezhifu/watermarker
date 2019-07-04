import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:watermark/api/response.dart';

class HttpRequest {
  static Dio dio = Dio();

  static Future<HttpResponse> fetch(url, {dynamic params, Map<String, String> header, method = 'get'}) async {

    Map<String, String> headers = HashMap();

    if (header != null) {
      headers.addAll(header);
    }

    Options option = new Options(method: method);
    option.headers = headers;
    option.connectTimeout = 15000;

    Response response;

    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      return HttpResponse("", false, "无网络连接", -1);
    }

    try {
      response = await dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      if (e.response != null) {
        return HttpResponse("" ,false, e.message, -2);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        return HttpResponse("" ,false, "网络连接超时", -2);
      }
    }

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return HttpResponse(response.data, true, "请求成功", response.statusCode, headers: response.headers);
      }
    } catch (e) {
        return HttpResponse(response.data, false, "请求异常", response.statusCode, headers: response.headers);
    }

    return HttpResponse("", false, "无效请求", response.statusCode);
  }
}