class OrderModel {
  int? orderId;
  int? time;
  double? totalPrice;
  String ? userId;

  OrderModel({this.orderId, this.time, this.totalPrice , this.userId});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    time = json['time'];
    totalPrice = json['totalPrice'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['time'] = this.time;
    data['totalPrice'] = this.totalPrice;
    data['userId']= this.userId;
    return data;
  }
}