import 'package:db_offline_flutter/data/models/get_all_customer_info_model.dart';

abstract class RemoteCustomerInfoRepository {
  Future<GetAllCustomerInfoModel> getAllCustomerInfo();
}