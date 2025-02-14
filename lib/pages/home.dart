import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myapp/pages/Perfil.dart';
import 'package:myapp/pages/map_pge.dart';

import 'package:geolocator/geolocator.dart';

import '../db/SharedPrefs.dart';
import '../db/user_dao.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

String? username;
Map<String, dynamic>? userDetails;

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _determinePosition();
    _loadUserData();
  }

  _loadUserData() async {
    username = await SharedPrefs().getUsername();
    if (username != null) {
      var data = await UserDao().getUsuario(username!);
      setState(() {
        userDetails = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      body: Column(
        children: [
          Stack(
            children: [
              _buildHeader(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ],
          ),
          _buildButton(),
          _buildMenu(),

        ],
      ), /*Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: 400,
                decoration: const BoxDecoration(
                  color: Color(0xFF66A9CF),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            userDetails!['username'] ?? 'Usuário',
                            style: GoogleFonts.alegreyaSc(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const Perfil();
                                  },
                                ));
                              },
                              icon: Icon(Icons.person, color: Colors.white)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.blueGrey,
              )
            ],
          )
        ],
      ),
    );*/
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
      decoration: const BoxDecoration(
        color: Color(0xFF66A9CF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userDetails?['username'] ?? 'Usuário',
                    style: GoogleFonts.alegreyaSc(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    userDetails?['email'] ?? 'email@example.com',
                    style: GoogleFonts.alegreyaSc(
                        fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Perfil()));
                },
                icon: const Icon(Icons.person_pin, color: Colors.black),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void Onpressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapPage(
          locations: [
            LatLng(-9.745249814503792, -36.63152135483646),
          ],
          initialPosition: LatLng(-9.745249814503792, -36.63152135483646),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () => Onpressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF66A9CF),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Column(
          children: [
            const Text("Comece de onde você está!",
                style: TextStyle(color: Colors.white)),
            Text(
              "Clique aqui para ver Pontos de Estudo!",
              style: GoogleFonts.jomhuria(
                  color: Colors.black,

                  fontSize: 25),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenu() {
    List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.calendar_today, 'label': 'Cronograma'},
      {'icon': Icons.note, 'label': 'Conteúdos'},
      {'icon': Icons.playlist_play, 'label': 'Playlist de '},
      {'icon': Icons.notifications, 'label': 'Lembrete'},
      {'icon': Icons.track_changes, 'label': 'Metas'},
      {'icon': Icons.help, 'label': 'Questões'},
    ];

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFF66A9CF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(menuItems[index]['icon'],
                    color: Colors.white, size: 30),
              ),
              const SizedBox(height: 5),
              Text(menuItems[index]['label'],
                  style: const TextStyle(fontSize: 14)),
            ],
          );
        },
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
