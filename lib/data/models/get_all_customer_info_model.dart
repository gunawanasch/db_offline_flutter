class GetAllCustomerInfoModel {
  GetAllCustomerInfoModel({
      int? status, 
      String? message, 
      List<DataGetAllCustomerInfo>? dataGetAllCustomerInfo,}){
    _status = status;
    _message = message;
    _dataGetAllCustomerInfo = dataGetAllCustomerInfo;
}

  GetAllCustomerInfoModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data_get_all_customer_info'] != null) {
      _dataGetAllCustomerInfo = [];
      json['data_get_all_customer_info'].forEach((v) {
        _dataGetAllCustomerInfo?.add(DataGetAllCustomerInfo.fromJson(v));
      });
    }
  }
  int? _status;
  String? _message;
  List<DataGetAllCustomerInfo>? _dataGetAllCustomerInfo;

  int? get status => _status;
  String? get message => _message;
  List<DataGetAllCustomerInfo>? get dataGetAllCustomerInfo => _dataGetAllCustomerInfo;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_dataGetAllCustomerInfo != null) {
      map['data_get_all_customer_info'] = _dataGetAllCustomerInfo?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  GetAllCustomerInfoModel.withError(String errorValue)
      : _dataGetAllCustomerInfo = [],
        error = errorValue;

}

class DataGetAllCustomerInfo {
  DataGetAllCustomerInfo({
      int? idCustomerInfo, 
      String? name, 
      String? phone,}){
    _idCustomerInfo = idCustomerInfo;
    _name = name;
    _phone = phone;
}

  DataGetAllCustomerInfo.fromJson(dynamic json) {
    _idCustomerInfo = json['id_customer_info'];
    _name = json['name'];
    _phone = json['phone'];
  }
  int? _idCustomerInfo;
  String? _name;
  String? _phone;

  int? get idCustomerInfo => _idCustomerInfo;
  String? get name => _name;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_customer_info'] = _idCustomerInfo;
    map['name'] = _name;
    map['phone'] = _phone;
    return map;
  }

}