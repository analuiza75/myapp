import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home.dart';
import 'sing.dart';

class tela1 extends StatefulWidget {
  const tela1({super.key});

  @override
  State<tela1> createState() => _tela1State();
}

class _tela1State extends State<tela1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF66A9CF),
        body: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              Stack(
                fit: StackFit.passthrough,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(32),
                      ),
                    ),
                    height: height / 1.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          "https://cdn-icons-png.flaticon.com/512/7650/7650340.png",
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -100,
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: Padding(
                        padding: const EdgeInsets.all(48),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Campo e-mail obrigatório.';
                                } else if (value.contains('@')) {
                                  return null;
                                } else {
                                  return 'Você precisa de um e-mail válido.';
                                }
                              },
                              cursorColor: const Color(0xFF10397B),
                              decoration: buildInputDecoration(
                                'E-mail',
                                Icons.person,
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: senhaController,
                              obscureText: true,
                              validator: (value) {
                                if (value!.length >= 6) {
                                  return null;
                                } else {
                                  return 'Você precisa de uma senha válida.';
                                }
                              },
                              cursorColor: const Color(0xFF10397B),
                              decoration: buildInputDecoration(
                                'Senha',
                                Icons.lock_outline,
                              ),
                            ),
                            const SizedBox(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Remember me',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 10, color: Colors.blue)),
                                Text('Forgot Password?',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 10, color: Colors.blue)),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  String email = emailController.text;
                                  String senha = senhaController.text;

                                  if (email == 'dri@gmail.com' &&
                                      senha == '1234567') {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const Home();
                                        },
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "E-mail e/ou Senha incorreto(s)",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF5AC22D),
                              ),
                              child: Text(
                                'Login',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Don’t have an account? ',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 11, color: Colors.black)),
                                Text('Create an account? ',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 11, color: Colors.blue)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildInputDecoration(String label, IconData iconData) {
    return InputDecoration(
      prefixIcon: Icon(iconData),
      labelText: label,
      floatingLabelStyle: const TextStyle(
        color: Color(0xFF6696E3),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xFF6696E3),
          width: 2,
        ),
      ),
    );
  }






}
