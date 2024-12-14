import 'package:flutter/material.dart';
import 'package:myapp/db/SharedPrefs.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/sing.dart';

class Splahpage extends StatefulWidget {
  const Splahpage({super.key});

  @override
  State<Splahpage> createState() => _SplahpageState();
}

class _SplahpageState extends State<Splahpage> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  checkUser() async {
    SharedPrefs shar = SharedPrefs();
    await Future.delayed(Duration(seconds: 3));
    bool checar = await shar.getUser();

    if (checar) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const Home();
        },
      ));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const AtEstudeee();
        },
      ));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
