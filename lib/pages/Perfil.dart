import 'package:flutter/material.dart';
import 'package:myapp/db/user_dao.dart';

import '../db/SharedPrefs.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _Perfil();
}

class _Perfil extends State<Perfil> {
  String? username;
  Map<String, dynamic>? userDetails;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    username = await SharedPrefs().getUsername();
    if (username != null) {
      var data = await UserDao().getUsuario(username!);
      setState(() {
        userDetails = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.teal.shade200,
                  child: Text(
                    userDetails!['username']?[0]?? '',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  userDetails!['username'] ?? 'Usuário',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),


            _buildInfoRow(
              icon: Icons.person,
              label: 'Nome',
              value: userDetails!['nome'],
            ),
            const Divider(),
            _buildInfoRow(
              icon: Icons.email,
              label: 'E-mail',
              value: userDetails!['email'] ?? 'Não informado',
            ),
            const Divider(),
            _buildInfoRow(
              icon: Icons.school,
              label: 'Curso',
              value: userDetails!['curso'] ?? 'Não informado',
            ),
            const Divider(),

            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {

                },
                icon: const Icon(Icons.edit,color: Colors.white,),
                label: const Text('Editar Perfil'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({required IconData icon, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.teal,
            size: 28,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
