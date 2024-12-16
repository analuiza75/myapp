import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "lembrete.db");
    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    print(dbPath);
    return database;
  }


  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql = "CREATE TABLE USER (username varchar(100) PRIMARY KEY, password varchar(100))";
    await db.execute(sql);

    sql =
    "INSERT INTO USER (username, password) VALUES ('joao@gmail.com', '123456')";
    await db.execute(sql);

    sql =
        "CREATE TABLE LEMBRETE (id INTEGER PRIMARY KEY, titulo varchar(100), materia varchar(100), text varchar(2000) )";
    await db.execute(sql);

    sql = "INSERT INTO LEMBRETE (id, titulo, materia, text) VALUES('1', 'Lipídeos', 'Biologia', 'o consumo excessivo de gorduras pode ocasionar o entupimento das artérias');";

    await db.execute(sql);

  }
}
