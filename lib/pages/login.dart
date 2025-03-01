import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/db/SharedPrefs.dart';
import 'package:myapp/db/userr_dao.dart';
import 'package:myapp/domain/user.dart';
import 'package:myapp/pages/AtEstude.dart';
import 'Home.dart';

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
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
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: onPressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF5AC22D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 78,
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const AtEstude();
                                    },
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 32,
                                ),
                              ),
                              child: Text(
                                'Criar uma nova conta',
                                style: GoogleFonts.montserrat(
                                  color: Color(0xFF3685CD),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                              ),
                            ),
                            ),
                        ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String label, IconData iconData) {
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

  Future<void> onPressed() async {
    if (formKey.currentState!.validate()) {
      String email = emailController.text;
      String senha = senhaController.text;

      bool auth = await UserDao().autenticar(email, senha);

      if (auth) {
        SharedPrefs().setUser(true);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Home();
            },
          ),
        );
      } else {
        print('E-mail e/ou Senha incorreto(s)');
      }
    }
  }
}
