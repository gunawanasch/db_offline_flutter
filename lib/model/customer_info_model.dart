import 'dart:convert';

List<CustomerInfoModel> customerInfoModelFromJson(String str) => List<CustomerInfoModel>.from(
    json.decode(str).map((x) => CustomerInfoModel.fromJson(x)));

String photosModelToJson(List<CustomerInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerInfoModel {
  late int? idCustomerInfo;
  late String? name;
  late String? phone;

  CustomerInfoModel({this.idCustomerInfo, this.name, this.phone});

  CustomerInfoModel.fromJson(Map<String, dynamic> json) {
    idCustomerInfo = json['id_customer_info'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_customer_info'] = this.idCustomerInfo;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }

  CustomerInfoModel.fromMap(Map<String, dynamic> map) {
    idCustomerInfo = map['id_customer_info'];
    name = map['name'];
    phone = map['phone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id_customer_info': idCustomerInfo,
      'name': name,
      'phone': phone,
    };
  }

}