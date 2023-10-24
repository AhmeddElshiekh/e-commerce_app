class AuthModel {
  bool? status;
  late final String massage;
  UserData? data;

  AuthModel({this.data, this.status, required this.massage});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  int? points;
  int? credit;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  UserData(
      {this.phone,
        this.name,
        this.email,
        this.image,
        this.id,
        this.credit,
        this.points,
        this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    points = json['points'];
    credit = json['credit'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}
