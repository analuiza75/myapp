import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "login.db");
    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    print(dbPath);
    return database;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql = "CREATE TABLE USER (email varchar(100) PRIMARY KEY, password varchar(100))";
    await db.execute(sql);

    sql =
    "INSERT INTO USER (email, password) VALUES ('dri@gmail.com', '123456789')";
    await db.execute(sql);
  }
}
