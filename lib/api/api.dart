import 'dart:convert';

import 'package:watermark/api/request.dart';
import 'package:watermark/api/response.dart';

import 'package:oktoast/oktoast.dart';

class TApi {
  static const String API_HOST = 'https://vip.svip8.vip';
  static const String API_MENU_DATA = "$API_HOST/getListDsp";
  static const String API_RECOMMEND_DATA = "$API_HOST/getLikeLink";

  ///获取支持菜单数据
  static getMenuData() async {
    HttpResponse response = await HttpRequest.fetch(API_MENU_DATA);
    if (response.success) {
      return jsonDecode(response.data);
    } else {
      showToast(response.message, dismissOtherToast: true);
      return null;
    };
  }

  ///获取推荐列表
  static getRecommendData() async {
    HttpResponse response = await HttpRequest.fetch(API_RECOMMEND_DATA);
    if (response.success) {
      return jsonDecode(response.data);
    } else {
      showToast(response.message, dismissOtherToast: true);
      return null;
    };
  }
}
