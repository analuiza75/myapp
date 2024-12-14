import 'package:flutter/cupertino.dart';


class metas {
  late int id;
  late String materia;
  late String objetivo;
  late String prazo;
  late String repeticao;


  metas({


    required this.materia,
    required this.objetivo,
    required this.prazo,
    required this.repeticao,
  });


  metas.fromJson(Map<String, dynamic> json) {
    id = json['id']; // Valor padrão para id
    materia = json['materia'] ?? 'Materia não disponível'; // Valor padrão
    objetivo = json['objetivo'] ?? 'Sem Objetivos';
    prazo = json['prazo'] ?? 'Prazo não disponível';
    repeticao = json['repeticao'] ?? 'Repetiçõa não informada';
  }


  Map<String, dynamic> toJson() {
    return {
      'materia': materia,
      'objetivo': objetivo,
      'prazo': prazo,
      'repeticao': repeticao,
    };
  }
}
