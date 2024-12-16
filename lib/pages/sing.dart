import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/domain/user.dart';
import 'package:flutter/material.dart';

import '../db/DBHelper2.dart';
import '../db/SharedPrefs.dart';
import '../db/user_dao.dart';
import 'InformacoesExtras.dart';
import 'InformacoesExtras.dart';

class AtEstudeee extends StatefulWidget {
  const AtEstudeee({super.key});

  @override
  State<AtEstudeee> createState() => _AtEstudeState();
}

class _AtEstudeState extends State<AtEstudeee> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController senhaController2 = TextEditingController();

  // Key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  initState()  {
    super.initState();

  }
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
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

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
                          /* Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Home();
                              },
                            ),
                          );*/
                          this.onPressed();
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

  Future<void> onPressed() async {
    if (formKey.currentState!.validate()) {
      String userNam = usernameController.text;
      String senha = senhaController.text;

      User user = User(username: userNam, password: senha);
      UserDao().saveUser(user);
      SharedPrefs().setUser(true);
      SharedPrefs().saveUsername(userNam);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("CADASTRO REALIZADO COM SUCESSO!"),backgroundColor: Colors.red,duration: Duration(seconds: 3), ));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return TelaInformacoesExtras(username: userNam,);
          },
        ),
      );
    }
  }
}