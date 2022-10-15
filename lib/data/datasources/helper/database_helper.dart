import 'package:db_offline_flutter/data/models/contact_model.dart';
import 'package:db_offline_flutter/data/models/customer_info_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initDb();
    }

    return _database;
  }

  static const String _tblContact = 'contact';
  static const String _tblCustomerInfo = 'customer_info';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/db_offline_flutter.db';

    var db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute(
          "CREATE TABLE $_tblContact ("
              "id_contact INTEGER PRIMARY KEY,"
              "name TEXT,"
              "phone TEXT,"
              "address TEXT"
              ")",
        );
        await database.execute(
          "CREATE TABLE $_tblCustomerInfo ("
              "id_customer_info INTEGER PRIMARY KEY,"
              "name TEXT,"
              "phone TEXT"
              ")",
        );
      },
    );
    return db;
  }

  Future<List<Map<String, dynamic>>> getAllContact() async {
    final db = await database;
    final List<Map<String, dynamic>> listResult = await db!.query(_tblContact);

    return listResult;
  }

  Future<ContactModel> insertContact(ContactModel contactModel) async {
    final db = await database;
    contactModel.idContact = await db!.insert(_tblContact, contactModel.toMap());

    return contactModel;
  }

  Future<int> updateContact(ContactModel contactModel) async {
    final db = await database;

    return await db!.update(
      _tblContact,
      contactModel.toMap(),
      where: "id_contact = ?",
      whereArgs: [contactModel.idContact],
    );
  }

  Future<int> deleteContact(int idContact) async {
    final db = await database;

    return await db!.delete(
      _tblContact,
      where: "id_contact = ?",
      whereArgs: [idContact],
    );
  }

  Future<List<Map<String, dynamic>>> getAllCustomerInfo() async {
    final db = await database;
    final List<Map<String, dynamic>> listResult = await db!.query(_tblCustomerInfo);

    return listResult;
  }

  Future<int> insertCustomerInfo(CustomerInfoModel customerInfoModel) async {
    final db = await database;

    return await db!.insert(_tblCustomerInfo, customerInfoModel.toMap());
  }

  Future<int> deleteAllCustomerInfo() async {
    final db = await database;

    return await db!.delete(_tblCustomerInfo);
  }

}