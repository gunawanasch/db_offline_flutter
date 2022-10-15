import 'package:db_offline_flutter/domain/entities/get_all_customer_info_entity.dart';

class GetAllCustomerInfoModel {
  int? status;
  String? message;
  List<DataGetAllCustomerInfo>? dataGetAllCustomerInfo;

  GetAllCustomerInfoModel(
      {this.status, this.message, this.dataGetAllCustomerInfo});

  GetAllCustomerInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data_get_all_customer_info'] != null) {
      dataGetAllCustomerInfo = <DataGetAllCustomerInfo>[];
      json['data_get_all_customer_info'].forEach((v) {
        dataGetAllCustomerInfo!.add(new DataGetAllCustomerInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.dataGetAllCustomerInfo != null) {
      data['data_get_all_customer_info'] =
          this.dataGetAllCustomerInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataGetAllCustomerInfo {
  int? idCustomerInfo;
  String? name;
  String? phone;

  DataGetAllCustomerInfo({this.idCustomerInfo, this.name, this.phone});

  DataGetAllCustomerInfo.fromJson(Map<String, dynamic> json) {
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

  GetAllCustomerInfoEntity toEntity() {
    return GetAllCustomerInfoEntity(
      idCustomerInfo: idCustomerInfo,
      name: name,
      phone: phone,
    );
  }
}