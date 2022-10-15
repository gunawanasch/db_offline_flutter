import 'dart:convert';
import 'package:db_offline_flutter/domain/entities/customer_info_entity.dart';

List<CustomerInfoModel> customerInfoModelFromJson(String str) => List<CustomerInfoModel>.from(
    json.decode(str).map((x) => CustomerInfoModel.fromJson(x)));

String customerInfoModelToJson(List<CustomerInfoModel> data) =>
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_customer_info'] = idCustomerInfo;
    data['name'] = name;
    data['phone'] = phone;
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

  factory CustomerInfoModel.fromEntity(CustomerInfoEntity customerInfoEntity) => CustomerInfoModel(
    idCustomerInfo: customerInfoEntity.idCustomerInfo,
    name: customerInfoEntity.name,
    phone: customerInfoEntity.phone,
  );

  CustomerInfoEntity toEntity() {
    return CustomerInfoEntity(
      idCustomerInfo: idCustomerInfo,
      name: name,
      phone: phone,
    );
  }
}