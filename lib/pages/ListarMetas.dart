
import 'package:flutter/material.dart';

import '../db/DBHelper.dart';
import '../db/metas_DAO.dart';
import '../domain/Metas.dart';
import 'CadastroMetas.dart';

class TelaApresentar extends StatefulWidget {
  TelaApresentar({Key? key}) : super(key: key);

  @override
  State<TelaApresentar> createState() => _TelaApresentarState();
}

class _TelaApresentarState extends State<TelaApresentar> {
  List<metas> metass = [];

  @override
  void initState() {
    super.initState();
    loadData();
    DBHelper().getTableInfo();

  }

  loadData() async {
    metass = await MetasDAO().listarMetas();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Metas'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroMetas(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('+ Adicionar meta'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: metass.length,
              itemBuilder: (context, index) {
                metas m = metass[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      'Meta do dia ${m.prazo}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${m.objetivo}'),
                    onTap: () {
                      // Ação ao clicar na meta
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}