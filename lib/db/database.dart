import 'package:flutter/material.dart';
import 'package:myapp/domain/conteudoEnem.dart';

class Database {
  static List conteudos = [
    Conteudoenem(
      titulo: 'Linguagens',
      color: Colors.lightBlue[100]!,
      iconPath: 'assets/livro.png',
    ),
    Conteudoenem(
      titulo: 'Humanas',
      color:  Colors.teal[100]!,
      iconPath: 'assets/mundo.png',
    ),
    Conteudoenem(
      titulo: 'Ciências da natureza',
      color: Colors.pink[100]!,
      iconPath: 'assets/biologico.png',
    ),
    Conteudoenem(
      titulo: 'Matemática',
      color: Colors.teal[100]!,
      iconPath: 'assets/matematica.png',
    ),
  ];
}
