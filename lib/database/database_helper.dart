import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper dbHelper = DatabaseHelper();

  static Database? _database;
  Future<Database> get database async =>
      _database ??= await createDatabase();

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, "db_offline_flutter.db"),
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute(
          "CREATE TABLE contact ("
              "id_contact INTEGER PRIMARY KEY,"
              "name TEXT,"
              "phone TEXT,"
              "address TEXT"
          ")",
        );
        await database.execute(
          "CREATE TABLE customer_info ("
              "id_customer_info INTEGER PRIMARY KEY,"
              "name TEXT,"
              "phone TEXT"
          ")",
        );
      },
    );
  }

}