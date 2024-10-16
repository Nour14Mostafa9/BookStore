import 'dart:convert';

class User {
  String? userId;
  String? userName;
  String? password;
  int? creditCardno;
  int? phone;

  User({this.userId ='', required this.userName,required this.password,required this.creditCardno,required this.phone});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    password = json['password'];

    creditCardno=json['creditCardno'];
    phone = json ['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['creditCardno']= this.creditCardno;
    return data;
  }
}

User userFromMap(String str)=>User.fromJson(json.decode(str));
String userToMap(User userData)=>json.encode(userData.toJson());


