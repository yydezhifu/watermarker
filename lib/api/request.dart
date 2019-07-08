import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:watermark/api/response.dart';
import 'package:watermark/common/cache_manager.dart';

class HttpRequest {
  static Dio dio = Dio();

  static Future<HttpResponse> fetch(url, { dynamic params, Map<String, String> header, method = 'get' }) async {

    Map<String, String> headers = HashMap();

    ///Headers
    if (header != null)  headers.addAll(header);

    ///Options
    Options option = new Options(method: method);
    option.headers = headers;
    option.connectTimeout = 15000;

    ///Caches
    var cacheObject = await CacheManager.get(url);
    var cacheData = cacheObject != null ? json.decode(cacheObject['value']) : null;
    if (cacheObject != null) {
      double timeDiff = (DateTime.now().millisecondsSinceEpoch - cacheObject['time']) / (3600 * 1000);
      if (timeDiff <= 24) {
        return HttpResponse(cacheData, true, "请求成功", 200);
      }
    }

    ///无网络
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return cacheData != null ? HttpResponse(cacheData, true, "请求成功", 200) : HttpResponse("", false, "无网络连接", -1);
    }

    Response response;
    ///dio request
    try {
      response = await dio.request(url, data: params, options: option);
      await CacheManager.set(CacheObject(url: url, value: response.data));
    } on DioError catch (e) {
      if (cacheData != null) {
        return HttpResponse(cacheData, true, "请求成功", 200);
      }
      if (e.response != null) {
        return HttpResponse("" ,false, e.message, -2);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        return HttpResponse("" ,false, "网络连接超时", -2);
      }
    }

    ///result
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