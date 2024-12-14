

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBHelper {


  // Banco de dados
  late Database _db;


  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'metas.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      String sql =
          'CREATE TABLE METAS (id INTEGER PRIMARY KEY AUTOINCREMENT, materia varchar(100), objetivo varchar(500),  prazo varchar(20), repeticao varchar(100));';
      await db.execute(sql);


      sql =
      " INSERT INTO METAS (materia, objetivo, prazo, repeticao) VALUES ('Matemática', 'Estudar trigonometria', '15/12/2024', 'Diariamente');"
      ;
      await db.execute(sql);


      //await db.execute(sql);
    });
    return _db;
    print(path);


  }


  Future<void> getTableInfo() async {
    final db = await initDB();
    final result = await db.rawQuery('PRAGMA table_info(METAS)');  // Obtém os atributos (colunas) da tabela HOSPITAIS


    for (var row in result) {
      print('Coluna: ${row['name']}');  // Exibe o nome de cada coluna
    }
  }






}
