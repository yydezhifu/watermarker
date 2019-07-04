class Recommend {
  int total;
  int perPage;
  int currentPage;
  List<Data> data;

  Recommend({this.total, this.perPage, this.currentPage, this.data});

  Recommend.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String title;
  String url;
  String ico;

  Data({this.id, this.title, this.url, this.ico});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['title'];
    url = json['url'];
    ico = json['ico'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['ico'] = this.ico;
    return data;
  }
}
