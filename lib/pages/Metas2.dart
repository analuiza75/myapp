import 'package:flutter/material.dart';

class Metas2 extends StatelessWidget {
  const Metas2 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController subjectController = TextEditingController();
    final TextEditingController goalController = TextEditingController();
    final TextEditingController deadlineController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Meta'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: subjectController,
              decoration: const InputDecoration(
                labelText: 'Matéria referente',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: goalController,
              decoration: const InputDecoration(
                labelText: 'Objetivo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: deadlineController,
              decoration: const InputDecoration(
                labelText: 'Prazo (DD/MM/AAAA)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
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
                // Lógica para tratamento da seleção
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para salvar a meta
                Navigator.pop(context); // Voltar para a tela anterior
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Concluir'),
            ),
          ],
        ),
      ),
    );
  }
}
