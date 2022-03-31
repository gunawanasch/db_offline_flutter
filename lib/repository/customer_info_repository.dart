import 'package:db_offline_flutter/database/dao/customer_info_dao.dart';
import 'package:db_offline_flutter/model/customer_info_model.dart';
import 'package:db_offline_flutter/network/api_base_helper.dart';
import 'package:dio/dio.dart';

class CustomerInfoRepository {
  APIBaseHelper _helper = APIBaseHelper();
  final customerInfoDao = CustomerInfoDao();

  Future<Response> getAllCustomerInfoAPI() async {
    Response response = await _helper.get("v1/getAllCustomerInfo");

    return response;
  }

  Future getAllCustomerInfoDB() => customerInfoDao.getAllCustomerInfo();

  Future insertCustomerInfo(CustomerInfoModel customerInfoModel) => customerInfoDao.insertContact(customerInfoModel);

  Future deleteAllCustomerInfo() => customerInfoDao.deleteAllCustomerInfo();

}