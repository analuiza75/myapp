
import 'package:sqflite/sqflite.dart';

import '../domain/Metas.dart';
import 'DBHelper.dart';


class MetasDAO{


  Future<List<metas>> listarMetas() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM METAS;';


    var result = await db.rawQuery(sql);


    List<metas> lista = [];
    for (var json in result) {
      metas metasAdd = metas.fromJson(json);
      lista.add(metasAdd);
    }


    return lista;
  }




  insertMetas(metas mets) async{


    Database db = await DBHelper().initDB();
    db.insert("METAS",mets.toJson());
  }






}
