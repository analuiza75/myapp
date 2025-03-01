import 'package:flutter/material.dart';
import 'package:myapp/domain/lembre.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/crie_lembrete.dart';
import 'package:myapp/db/lembrete_dao.dart';
import 'package:myapp/db/db_helper.dart';

class LembreteScreen extends StatefulWidget {
  LembreteScreen({Key? key}) : super(key: key);

  @override
  State<LembreteScreen> createState() => _LembreteScreenState();
}

class _LembreteScreenState extends State<LembreteScreen> {
  Future<List<Lembrete>>? futurelembretess;

  @override
  void initState() {
    super.initState();
    futurelembretess = LembreteDao().listarLembretes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seus Lembretes'),
        backgroundColor: Color(0xFF66A9CF),
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
                    builder: (context) => CadastroLembretes(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Adicionar lembrete'),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Lembrete>>(
              future: futurelembretess,
              builder: (context, snapshot) {

                if(futurelembretess == null){
                  return Center(child: Text('Dados ainda nao foram carregados'));
                }

                if(snapshot.connectionState == ConnectionState){
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Center(
                      child: Text('Nenhum lembrete encontrado'));
                }

                if(snapshot.hasData) {

                  List<Lembrete> lembretess = snapshot.data!;

                  return ListView.builder(
                    itemCount: lembretess.length,
                    itemBuilder: (context, index) {
                      Lembrete m = lembretess[index];
                      return Card(
                        color: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                m.titulo,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                m.materia,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                m.text,
                                style: TextStyle(
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },

                  );
                }

                return Center(child: CircularProgressIndicator());
              }
            ),
          ),
        ],
      ),
    );
  }
}
