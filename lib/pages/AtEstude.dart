import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/login.dart';

import 'package:myapp/api/address_api.dart';
import '../db/db_helper.dart';
import '../db/SharedPrefs.dart';
import '../db/userr_dao.dart';
import '../domain/address.dart';


class AtEstude extends StatefulWidget {
  const AtEstude({super.key});


  @override
  State<AtEstude> createState() => _AtEstudeState();
}


class _AtEstudeState extends State<AtEstude> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController senhaController2 = TextEditingController();
  TextEditingController dddController = TextEditingController();
  TextEditingController numeroController = TextEditingController();




  // Key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  initState() {
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
                    controller: emailController,
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


                  TextFormField(
                    controller: dddController,
                    decoration: InputDecoration(
                      hintText: 'DDD',
                      suffixIcon: IconButton(
                        onPressed: onPressedDddButton,
                        icon: const Icon(Icons.search),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      hintStyle: GoogleFonts.montserrat(fontSize: 12),
                    ),
                  ),


                  const SizedBox(height: 16),
                  TextFormField(
                    controller: numeroController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Você precisa digitar um número válido";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.phone),
                      hintText: 'Número de telefone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintStyle: GoogleFonts.montserrat(fontSize: 12),
                    ),
                    keyboardType: TextInputType.phone,
                  ),



                  const  SizedBox(height: 32),
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
                                "Senhas não conferem",
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
  Future<void> onPressedDddButton() async {
    String ddd = dddController.text;
    try {
      Address address = await AddressApi().findAddressByDDD(ddd);
      numeroController.text = address.street;
    } catch (e) {
      showSnackBar('Ocorreu um erro inesperado!');
    }
  }

  showSnackBar(String snackBarMessage) {
    SnackBar snackBar = SnackBar(
      content: Text("Ocorreu um erro inesperado!"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> onPressed() async {
    if (formKey.currentState!.validate()) {
      String userEm = emailController.text;
      String senha = senhaController.text;


      User user = User(senha, userEm);
      UserDao().saveUser(user);
      SharedPrefs().setUser(true);


      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("CADASTRO REALIZADO COM SUCESSO!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ));
    }
  }

}






