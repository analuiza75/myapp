import 'package:flutter/material.dart';
import 'package:myapp/pages/crie_lembrete.dart';

class Lembrete {
  late int id;
  late String titulo;
  late String materia;
  late String text;

  Lembrete({
    required this.titulo,
    required this.materia,
    required this.text,
  });

  Lembrete.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    materia = json['materia'];
    text = json['text'];
  }

  Map<String, dynamic> toJson(){
    return{
      'titulo': titulo,
      'materia': materia,
      'text': text,
    };
  }
}