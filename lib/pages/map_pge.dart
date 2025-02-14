import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  List<LatLng> locations;
  LatLng initialPosition;

  MapPage({super.key, required this.locations, required this.initialPosition});

  @override
  State<MapPage> createState() => MapSampleState();
}

class MapSampleState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  Set<Marker> markers = <Marker>{};

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData(){


    for(LatLng latLog in widget.locations ){
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      var mk = Marker(markerId: MarkerId(id), position: latLog);
      markers.add(mk);
    }

    var mk = Marker(markerId: MarkerId("1"), position: widget.initialPosition);
    markers.add(mk);

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
           markers: markers,
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: widget.initialPosition,
            zoom: 9,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}