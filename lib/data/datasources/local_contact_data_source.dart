import 'package:db_offline_flutter/data/datasources/helper/database_helper.dart';
import 'package:db_offline_flutter/data/models/contact_model.dart';

abstract class LocalContactDataSource {
  Future<List<ContactModel>> getAllContact();
  Future<String> insertContact(ContactModel contactModel);
  Future<String> updateContact(ContactModel contactModel);
  Future<String> deleteContact(int idContact);
}

class LocalContactDataSourceImpl implements LocalContactDataSource {
  DatabaseHelper databaseHelper;

  LocalContactDataSourceImpl(this.databaseHelper);

  @override
  Future<List<ContactModel>> getAllContact() async {
    final result = await databaseHelper.getAllContact();

    return result.map((data) => ContactModel.fromMap(data)).toList();
  }

  @override
  Future<String> insertContact(ContactModel contactModel) async {
    try {
      await databaseHelper.insertContact(contactModel);

      return "Insert success";
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String> updateContact(ContactModel contactModel) async {
    try {
      await databaseHelper.updateContact(contactModel);

      return "Update success";
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String> deleteContact(int idContact) async {
    try {
      await databaseHelper.deleteContact(idContact);

      return "Delete success";
    } catch (e) {
      return e.toString();
    }
  }

}