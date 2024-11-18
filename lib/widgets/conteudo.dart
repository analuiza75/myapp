import 'package:myapp/domain/conteudoEnem.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/lista_conteudos_materia.dart';

class ContainerConteudo extends StatefulWidget {
  final Conteudoenem conteudoenem;

  const ContainerConteudo({
    super.key,
    required this.conteudoenem,
  });
  @override
  State<ContainerConteudo> createState() => _ContainerConteudoState();
}

class _ContainerConteudoState extends State<ContainerConteudo> {
  Conteudoenem get enem => widget.conteudoenem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Conteudo(
                conteudoenem: enem,
              );
            },
          ),
        );
      },
      child: Container(
        height: 87,
        width: 294,
        margin: EdgeInsets.only(bottom: 16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: enem.color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 16.0),
            Text(
              enem.titulo,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),

            Image.asset(
              enem.iconPath,
              height: 40,
              width: 40,
            ),
          ],
        ),
      ),
    );
  }
}
