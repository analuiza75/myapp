

import 'package:flutter/material.dart';
import 'package:myapp/domain/Metas.dart';
import 'package:myapp/db/metas_DAO.dart';


class CadastroMetas extends StatefulWidget {
  CadastroMetas({Key? key}) : super(key: key);


  @override
  State<CadastroMetas> createState() => _CadastroMetasState();
}


class _CadastroMetasState extends State<CadastroMetas> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final TextEditingController _materia = TextEditingController();
  final TextEditingController _objetivo = TextEditingController();
  final TextEditingController _prazo = TextEditingController();


  String? _repetition;


  Future<void> _saveMetas() async {
    if (_formKey.currentState!.validate()) {
      final meta = metas(
        materia: _materia.text,
        objetivo: _objetivo.text,
        prazo: _prazo.text,
        repeticao: _repetition!,
      );




      final addMetas = MetasDAO();
      await addMetas.insertMetas(meta);




      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Meta salva com sucesso!')));
      print("Tudo certo");


      _prazo.clear();
      _objetivo.clear();
      _materia.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Meta'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade50,
      ),
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Imagem de fundo
            Image.asset(
              'assets/img.png',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            // Conteúdo sobreposto
            Padding(
              padding: const EdgeInsets.only(top: 220.0), // Mover conteúdo para sobrepor a imagem
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0), // Espaçamento horizontal


                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _materia,
                        decoration: const InputDecoration(
                          labelText: 'Matéria referente',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira a matéria';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _objetivo,
                        decoration: const InputDecoration(
                          labelText: 'Objetivo',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira o objetivo';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _prazo,
                        decoration: const InputDecoration(
                          labelText: 'Prazo (DD/MM/AAAA)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira o prazo';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Repetições',
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Não repetir',
                            child: Text('Não repetir'),
                          ),
                          DropdownMenuItem(
                            value: 'Diariamente',
                            child: Text('Diariamente'),
                          ),
                          DropdownMenuItem(
                            value: 'Semanalmente',
                            child: Text('Semanalmente'),
                          ),
                          DropdownMenuItem(
                            value: 'Dia sim, dia não',
                            child: Text('Dia sim, dia não'),
                          ),
                        ],
                        onChanged: (value) {
                          _repetition = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, selecione uma repetição';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {


                            _saveMetas();


                            print('Matéria: $_materia');
                            print('Objetivo: $_objetivo');
                            print('Prazo: $_prazo');
                            print('Repetição: $_repetition');


                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Concluir',style: TextStyle(color: Colors.white,fontSize: 16),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
