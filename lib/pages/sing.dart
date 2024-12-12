import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/home.dart';
import 'package:flutter/material.dart';

class AtEstude extends StatefulWidget {
  const AtEstude({super.key});

  @override
  State<AtEstude> createState() => _AtEstudeState();
}

class _AtEstudeState extends State<AtEstude> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController senhaController2 = TextEditingController();

  // Key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Text(
                  "Sign up",
                  style: GoogleFonts.montserratAlternates(
                    fontWeight: FontWeight.bold,
                    fontSize: 31,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xFF66A9CF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey, // Aqui é onde você conecta a chave do formulário
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo e-mail obrigatório.';
                      } else if (value.contains('@')) {
                        return null;
                      } else {
                        return 'Informe um e-mail válido';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      hintStyle: GoogleFonts.montserrat(fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      hintText: 'Full name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      hintStyle: GoogleFonts.montserrat(fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Home();
                              },
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content:
                            Text(
                              "Senhas não conferem!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
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
                        color: Colors.black,
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
}
