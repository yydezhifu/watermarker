class Menu {
  int total;
  int perPage;
  int currentPage;
  List<Data> data;

  Menu({this.total, this.perPage, this.currentPage, this.data});

  Menu.fromJson(Map<String, dynamic> json) {
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
  String name;
  String address;
  String description;
  String keywords;
  String tongji;
  String logo;
  String subheading;
  String abbreviate;
  String state;
  String courseUrl;
  String qqGroup;
  String groupUrl;
  String ranking;

  Data(
      {this.id,
        this.name,
        this.address,
        this.description,
        this.keywords,
        this.tongji,
        this.logo,
        this.subheading,
        this.abbreviate,
        this.state,
        this.courseUrl,
        this.qqGroup,
        this.groupUrl,
        this.ranking});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['name'];
    address = json['address'];
    description = json['description'];
    keywords = json['keywords'];
    tongji = json['tongji'];
    logo = json['logo'];
    subheading = json['subheading'];
    abbreviate = json['abbreviate'];
    state = json['state'];
    courseUrl = json['courseUrl'];
    qqGroup = json['qqGroup'];
    groupUrl = json['groupUrl'];
    ranking = json['ranking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['description'] = this.description;
    data['keywords'] = this.keywords;
    data['tongji'] = this.tongji;
    data['logo'] = this.logo;
    data['subheading'] = this.subheading;
    data['abbreviate'] = this.abbreviate;
    data['state'] = this.state;
    data['courseUrl'] = this.courseUrl;
    data['qqGroup'] = this.qqGroup;
    data['groupUrl'] = this.groupUrl;
    data['ranking'] = this.ranking;
    return data;
  }
}
