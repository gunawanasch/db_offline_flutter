import 'package:db_offline_flutter/data/data_sources/remote/network/api_base_helper.dart';
import 'package:db_offline_flutter/data/models/get_all_customer_info_model.dart';
import 'package:dio/dio.dart';

class CustomerInfoProvider {
  final APIBaseHelper _helper = APIBaseHelper();
  final Dio _dio;

  CustomerInfoProvider(this._dio) {
    _dio.options = _helper.createOption();
  }

  Future<GetAllCustomerInfoModel> getAllCustomerInfo() async {
    try {
      Response response = await _dio.get("v2/getAllCustomerInfo");

      return GetAllCustomerInfoModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception ocurred: $error stacktrace: $stacktrace");

      return GetAllCustomerInfoModel.withError(_helper.handleError(error));
    }
  }

}