import 'package:myapp/db/db_helper.dart';
import 'package:myapp/domain/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  autenticar(String email, String password) async {
    Database db = await DBHelper().initDB();

    String sql = 'SELECT * FROM USER '
        'WHERE email = ? AND '
        'PASSWORD = ?;';

    var result = await db.rawQuery(sql, [email, password]);
    return result.isNotEmpty;
  }

  saveUser(User user) async {
    Database db = await DBHelper().initDB();
    db.insert('USER', user.toJson());
  }
  Future<List<Map<String, dynamic>>> getAllData() async {

    final db = await openDatabase('meu_banco.db');


    return await db.query('minha_tabela');
  }


}