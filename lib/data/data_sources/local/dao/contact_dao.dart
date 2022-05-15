import 'package:db_offline_flutter/data/data_sources/local/helper/database_helper.dart';
import 'package:db_offline_flutter/data/models/contact_model.dart';

class ContactDao {
  DatabaseHelper dbHelper;

  ContactDao(this.dbHelper);

  Future<List<ContactModel>> getAllContact() async {
    final db = await dbHelper.database;
    final List<Map<String, Object?>> queryResult = await db.query("contact");

    return queryResult.map((e) => ContactModel.fromMap(e)).toList();
  }

  Future<ContactModel> insertContact(ContactModel contactModel) async {
    final db = await dbHelper.database;
    contactModel.idContact = await db.insert("contact", contactModel.toMap());

    return contactModel;
  }

  Future<int> updateContact(ContactModel contactModel) async {
    final db = await dbHelper.database;

    return await db.update(
      "contact",
      contactModel.toMap(),
      where: "id_contact = ?",
      whereArgs: [contactModel.idContact],
    );
  }

  Future<int> deleteContact(int idContact) async {
    final db = await dbHelper.database;

    return await db.delete(
      "contact",
      where: "id_contact = ?",
      whereArgs: [idContact],
    );
  }

}