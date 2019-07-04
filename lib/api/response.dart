
class HttpResponse {
  var data;
  bool success;
  String message;
  int code;  // -1.网络错误 -2.请求超时
  var headers;

  HttpResponse(this.data, this.success, this.message,  this.code, {this.headers});
}