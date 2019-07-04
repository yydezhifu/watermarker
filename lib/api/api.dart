import 'dart:convert';

import 'package:watermark/api/request.dart';
import 'package:watermark/api/response.dart';

class TApi {
  static const String API_HOST = 'https://vip.svip8.vip';
  static const String API_MENU_DATA = "$API_HOST/getListDsp";

  ///获取推荐菜单数据
  static getMenuData() async {
    HttpResponse response = await HttpRequest.fetch(API_MENU_DATA);
    return jsonDecode(response.data);
  }
}
