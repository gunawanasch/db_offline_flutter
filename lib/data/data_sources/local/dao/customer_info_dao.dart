import 'package:db_offline_flutter/data/data_sources/local/helper/database_helper.dart';
import 'package:db_offline_flutter/data/models/customer_info_model.dart';

class CustomerInfoDao {
  DatabaseHelper dbHelper;

  CustomerInfoDao(this.dbHelper);

  Future<List<CustomerInfoModel>> getAllCustomerInfo() async {
    final db = await dbHelper.database;
    final List<Map<String, Object?>> queryResult = await db.query("customer_info");

    return queryResult.map((e) => CustomerInfoModel.fromMap(e)).toList();
  }

  Future<CustomerInfoModel> insertContact(CustomerInfoModel customerInfoModel) async {
    final db = await dbHelper.database;
    customerInfoModel.idCustomerInfo = await db.insert("customer_info", customerInfoModel.toMap());

    return customerInfoModel;
  }

  Future<int> deleteAllCustomerInfo() async {
    final db = await dbHelper.database;

    return await db.delete("customer_info");
  }

}