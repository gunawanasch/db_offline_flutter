import 'package:db_offline_flutter/data/models/customer_info_model.dart';

abstract class LocalCustomerInfoRepository {
  Future<List<CustomerInfoModel>> getAllCustomerInfo();

  Future<CustomerInfoModel> insertCustomerInfo(CustomerInfoModel customerInfoModel);

  Future<int> deleteAllCustomerInfo();
}