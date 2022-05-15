import 'get_all_customer_info_model.dart';

class GetAllCustomerInfoResponseModel {
  final List<DataGetAllCustomerInfo> listDataGetAllCustomerInfoModel;
  final String error;

  GetAllCustomerInfoResponseModel(this.listDataGetAllCustomerInfoModel, this.error);

  GetAllCustomerInfoResponseModel.fromJson(List<dynamic> json)
      : listDataGetAllCustomerInfoModel = (json).map((i) => DataGetAllCustomerInfo.fromJson(i)).toList(),
        error = "";

  GetAllCustomerInfoResponseModel.withError(String errorValue)
      : listDataGetAllCustomerInfoModel = [],
        error = errorValue;
}