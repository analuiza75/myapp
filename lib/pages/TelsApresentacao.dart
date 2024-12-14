import 'package:flutter/material.dart';
import '../domain/user.dart';

class TelaApresentacao extends StatefulWidget {
  const TelaApresentacao({super.key});

  @override
  State<TelaApresentacao> createState() => _TelaApresentacaoState();
}

class _TelaApresentacaoState extends State<TelaApresentacao> {
  List<User> informacao = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    informacao = await InformacoesDao().listarPacotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: const Text(
          'Dados pessoais',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey,
                    ),
                    backgroundColor: Color.fromARGB(255, 189, 114, 114),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // Implementar a função para alterar foto
                    },
                    child: const Text(
                      'Alterar foto',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nome',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text('${informacao}'),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text('${informacao}'),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Curso',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text('${informacao  }'),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Implementar a função de cadastrar
                },
                icon: const Icon(Icons.check),
                label: const Text('Alterar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade200,
                  foregroundColor: Colors.black,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}