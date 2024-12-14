import 'package:flutter/material.dart';
import 'package:myapp/pages/Perfil.dart';
import 'package:myapp/pages/home.dart';

import '../db/user_dao.dart';

class TelaInformacoesExtras extends StatefulWidget {
  final String username;

  const TelaInformacoesExtras({super.key, required this.username});

  @override
  State<TelaInformacoesExtras> createState() => _TelaInformacoesExtrasState();
}

class _TelaInformacoesExtrasState extends State<TelaInformacoesExtras> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cursoController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final UserDao userDao = UserDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informações Extras"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nomeController,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório.' : null,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório.';
                  } else if (!value.contains('@')) {
                    return 'Informe um email válido.';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: cursoController,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório.' : null,
                decoration: const InputDecoration(labelText: 'Curso'),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await userDao.updateUserDetails(
                      widget.username,
                      nomeController.text,
                      emailController.text,
                      cursoController.text,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Informações atualizadas com sucesso!")),
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Home();
                        },
                      ),
                    );                  }
                },
                child: const Text("Atualizar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
