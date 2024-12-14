import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myapp/domain/telahistoria.dart';
import 'package:url_launcher/url_launcher.dart';

class historia extends StatefulWidget {
  final Telinha telinha;

  const historia({
    super.key,
    required this.telinha,
  });

  @override
  State<historia> createState() => _historiaState();
}

class _historiaState extends State<historia> {
  Telinha get aula => widget.telinha;

  Future<void> _lauchUrl() async {
    final Uri url = Uri.parse(aula.link);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "nao posso ir para o link!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      width: 294,
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color:
            Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: _lauchUrl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 16.0),
            Text(
              aula.titulo,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Image.asset(
              aula.iconPath,
              height: 35,
              width: 35,
            ),
          ],
        ),
      ),
    );
  }
}
