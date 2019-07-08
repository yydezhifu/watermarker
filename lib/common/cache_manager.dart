import 'dart:convert';
import 'dart:io';

import 'package:objectdb/objectdb.dart';
import 'package:path_provider/path_provider.dart';

/// 缓存处理
class CacheManager {
  static ObjectDB db;

  static init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    db = ObjectDB("${dir.path}/caches.db");
    await db.open();
  }

  static set(CacheObject cacheObject) async {
    cacheObject.time = DateTime.now().millisecondsSinceEpoch;
    var cacheObjectList = await db.find({ 'url': cacheObject.url });
    if (cacheObjectList != null && cacheObjectList.length > 0) {
      await db.update({
        'url': cacheObjectList[0]['url']
      }, {
        'value': json.encode(cacheObject.value),
        'time': cacheObject.time
      });
    } else {
      await db.insert(cacheObject.toJson());
    }
  }

  static get(String url) async {
    var cacheObjectList = await db.find({ "url": url });
    if (cacheObjectList != null && cacheObjectList.length > 0) {
      return cacheObjectList[0];
    }
  }

  static clearCaches() async {
    await db.remove({});
  }
}

/// 缓存对象
class CacheObject {
  String url;
  dynamic value;
  int time;

  CacheObject({this.url, this.value, this.time});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['value'] = json.encode(this.value);
    data['time'] = this.time;
    return data;
  }
}