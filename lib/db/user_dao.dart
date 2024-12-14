import 'package:myapp/db/DBHelper2.dart';
import 'package:sqflite/sqlite_api.dart';

import '../domain/user.dart';

class UserDao {
  Future<bool> autenticar(String username, String password) async {
    Database db = await DBHelper().initDB();

    String sql = '''
      SELECT * FROM USER 
      WHERE username = ? AND 
            password = ?;
    ''';

    var result = await db.rawQuery(sql, [username, password]);
    return result.isNotEmpty;
  }

  Future<void> saveUser(User user) async {
    Database db = await DBHelper().initDB();
      await db.insert('USER', user.toJson());

  }

  Future<void> updateUserDetails(String username, String name, String email, String course) async {
    Database db = await DBHelper().initDB();

    String sql = '''
      UPDATE USER 
      SET nome = ?, 
          email = ?, 
          curso = ? 
      WHERE username = ?;
    ''';

    await db.rawUpdate(sql, [name, email, course, username]);
  }

  Future<Map<String, dynamic>?> getUsuario(String username) async {
    Database db = await DBHelper().initDB();

    String sql = '''
      SELECT * FROM USER 
      WHERE username = ?;
    ''';

    var result = await db.rawQuery(sql, [username]);
    return result.isNotEmpty ? result.first : null;
  }

}