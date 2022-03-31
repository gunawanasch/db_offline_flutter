import 'package:db_offline_flutter/model/customer_info_model.dart';
import '../database_helper.dart';

class CustomerInfoDao {
  final dbHelper = DatabaseHelper.dbHelper;

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