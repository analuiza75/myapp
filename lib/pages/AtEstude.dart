import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/domain/user.dart';
import 'package:myapp/pages/login.dart';
import '../db/SharedPrefs.dart';
import '../db/userr_dao.dart';

class AtEstude extends StatefulWidget {
  const AtEstude({super.key});

  @override
  State<AtEstude> createState() => _AtEstudeState();
}

class _AtEstudeState extends State<AtEstude> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController senhaController2 = TextEditingController();
  TextEditingController nomeController2 = TextEditingController();
  TextEditingController estadoController2 = TextEditingController();
  TextEditingController idController2 = TextEditingController();


  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> fetchWeather() async {
    final url = Uri.parse("https://brasilapi.com.br/api/cptec/v1/clima/capital");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Erro ao buscar clima");
      }
    } catch (e) {
      throw Exception("Erro: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FutureBuilder<Map<String, dynamic>>(
            future: fetchWeather(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Erro ao carregar clima"));
              } else if (snapshot.hasData) {

                List<dynamic> cidades = snapshot.data?["capital"] ?? [];
                return Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF66A9CF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Clima das Capitais",
                        style: GoogleFonts.montserratAlternates(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      for (var cidade in cidades)
                        Text(
                          "${cidade['cidade']}: ${cidade['atual']['temperatura']}°C",
                          style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white),
                        ),
                    ],
                  ),
                );
              } else {
                return Center(child: Text("Nenhuma informação disponível"));
              }
            },
          ),

          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 24),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      hintStyle: GoogleFonts.montserrat(fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: senhaController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo senha obrigatório.';
                      } else if (value.length >= 8) {
                        return null;
                      } else {
                        return 'Informe uma senha válida';
                      }
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                      hintText: 'Password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      hintStyle: GoogleFonts.montserrat(fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: senhaController2,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo senha obrigatório.';
                      } else if (value.length >= 8) {
                        return null;
                      } else {
                        return 'Informe uma senha válida';
                      }
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                      hintText: 'Repeat Password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      hintStyle: GoogleFonts.montserrat(fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String senha = senhaController.text;
                        String senha2 = senhaController2.text;

                        if (senha == senha2) {
                          this.onPressed();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Senhas não conferem!",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      "Create Account",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5AC22D),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onPressed() async {
    if (formKey.currentState!.validate()) {
      String userEm = emailController.text;
      String senha = senhaController.text;

      User user = User(senha, userEm);
      UserDao().saveUser(user);
      SharedPrefs().setUser(true);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("CADASTRO REALIZADO COM SUCESSO!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
