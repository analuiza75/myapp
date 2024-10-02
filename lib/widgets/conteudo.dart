import 'package:myapp/pages/conteudos_enem.dart';
import 'package:flutter/material.dart';

class CardPacoteTuristico extends StatefulWidget {
  @override
  State<CardPacoteTuristico> createState() => _CardPacoteTuristicoState();
}

class _CardPacoteTuristicoState extends State<CardPacoteTuristico> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ConteudosEnem(
                
              );
            },
          ),
          
        );
      },
    );
  }
}
