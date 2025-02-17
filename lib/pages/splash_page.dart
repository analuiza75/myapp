import 'package:myapp/db/SharedPrefs.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/AtEstude.dart';
import 'package:myapp/pages/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  checkUserStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    bool userStatus = await SharedPrefs().getUser();

    if (userStatus) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const Tela1();
        },
      ));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const Tela1();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE0E0E0FF),
      child: Image.network(
    "https://cdn-icons-png.flaticon.com/512/7650/7650340.png",
    ),
    );
  }
}