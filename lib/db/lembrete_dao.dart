import 'package:myapp/db/db_helper.dart';
import 'package:myapp/domain/lembre.dart';
import 'package:sqflite/sqflite.dart';

class LembreteDao {
  Future<List<Lembrete>> listarLembretes() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM LEMBRETE;';

    var result = await db.rawQuery(sql);

    List<Lembrete> lista = [];
    for (var json in result) {
      Lembrete lembre = Lembrete.fromJson(json);
      lista.add(lembre);
    }

    return lista;
  }

  insertLembrete(Lembrete info) async {
    Database db = await DBHelper().initDB();
    db.insert("LEMBRETE", info.toJson());
  }
}
