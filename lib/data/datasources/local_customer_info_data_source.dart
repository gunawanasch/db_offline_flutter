import 'package:db_offline_flutter/data/datasources/helper/database_helper.dart';
import 'package:db_offline_flutter/data/models/customer_info_model.dart';

abstract class LocalCustomerInfoDataSource {
  Future<List<CustomerInfoModel>> getAllCustomerInfo();
  Future<String> insertCustomerInfo(CustomerInfoModel customerInfoModel);
  Future<String> deleteAllCustomerInfo();
}

class LocalCustomerInfoDataSourceImpl implements LocalCustomerInfoDataSource {
  DatabaseHelper databaseHelper;

  LocalCustomerInfoDataSourceImpl(this.databaseHelper);

  @override
  Future<List<CustomerInfoModel>> getAllCustomerInfo() async {
    final result = await databaseHelper.getAllCustomerInfo();

    return result.map((data) => CustomerInfoModel.fromMap(data)).toList();
  }

  @override
  Future<String> insertCustomerInfo(CustomerInfoModel customerInfoModel) async {
    try {
      await databaseHelper.insertCustomerInfo(customerInfoModel);

      return "Insert success";
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String> deleteAllCustomerInfo() async {
    try {
      await databaseHelper.deleteAllCustomerInfo();

      return "Delete success";
    } catch (e) {
      return e.toString();
    }
  }

}