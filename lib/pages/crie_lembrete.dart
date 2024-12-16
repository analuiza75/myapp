import 'package:flutter/material.dart';
import 'package:myapp/domain/lembre.dart';


import '../db/lembrete_dao.dart';


class CadastroLembretes extends StatefulWidget {
  CadastroLembretes({Key? key}) : super(key: key);


  @override
  State<CadastroLembretes> createState() => _CadastroLembretesState();
}


class _CadastroLembretesState extends State<CadastroLembretes> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final TextEditingController _texto = TextEditingController();
  final TextEditingController _materia = TextEditingController();
  final TextEditingController _titulo = TextEditingController();





  Future<void> _saveMetas() async {
    if (_formKey.currentState!.validate()) {
      final mets = Lembrete(
          materia: _materia.text,
          text: _texto.text,
          titulo: _titulo.text


      );




      final addMetas = LembreteDao();
      await addMetas.insertLembrete(mets);




      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Lembrete salvo com sucesso!')));
      print("Tudo certo");



    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar lembrete'),
        backgroundColor: Color(0xFF66A9CF),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _titulo,
                      decoration: const InputDecoration(
                        labelText: 'Matéria referente',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o título';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _materia,
                      decoration: const InputDecoration(
                        labelText: 'Máteria',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a máteria';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _texto,
                      decoration: const InputDecoration(
                        labelText: 'texto',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o Texto';
                        }
                        return null;
                      },
                    ),


                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {


                          _saveMetas();


                          print('Titulo: $_titulo');
                          print('Materia: $_materia');
                          print('Texto: $_texto');


                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5AC22D),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Concluir',style: TextStyle(color: Colors.white,fontSize: 16),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

