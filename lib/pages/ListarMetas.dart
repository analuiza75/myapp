
import 'package:flutter/material.dart';
import 'package:myapp/db/DBHelper.dart';
import 'package:myapp/db/metas_DAO.dart';
import 'package:myapp/domain/Metas.dart';
import 'package:myapp/pages/CadastroMetas.dart';
import 'package:myapp/pages/map_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Listarmetas extends StatefulWidget {
  Listarmetas({Key? key}) : super(key: key);

  @override
  State<Listarmetas> createState() => _Listarmetas();
}

class _Listarmetas extends State<Listarmetas> {
  late Future<List<metas>> futureMetas;

  @override
  void initState() {
    super.initState();
    futureMetas = MetasDAO().listarMetas();
     DBHelper().getTableInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metas'),
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
              onPressed: () async {
                LatLng latLong =
                LatLng(-9.745468079153966, -36.63138136459527);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MapPage(
                        location: latLong,
                      );
                    },
                  ),
                );
              },
              child: Row(
                children: [
                  Text(
                    "Instituições ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.gps_fixed, color: Colors.white)
                ],
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroMetas(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('+ Adicionar meta'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () async {
                  LatLng latLong =
                  LatLng(-9.760029443349252, -36.654078663237456);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MapPage(
                          location: latLong,
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  'Ver no mapa',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<metas>>(
              future: futureMetas,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro ao carregar metas'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Nenhuma meta encontrada'));
                }

                List<metas> metass = snapshot.data!;
                return ListView.builder(
                  itemCount: metass.length,
                  itemBuilder: (context, index) {
                    metas m = metass[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          'Meta do dia ${m.prazo}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('${m.objetivo}'),
                        onTap: () {

                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
