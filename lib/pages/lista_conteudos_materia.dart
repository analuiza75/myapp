import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Conteudo extends StatefulWidget {
  const Conteudo({super.key, required conteudoenem});

  @override
  State<Conteudo> createState() => _conteudoState();
}

class _conteudoState extends State<Conteudo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //tela demonstração(tela da Andrielli)
      backgroundColor: Color(0xFFE8E8E8),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "teste!",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xFFE8C6D2),
            ),
          ),
        ],
      ),
    );
  }
}
