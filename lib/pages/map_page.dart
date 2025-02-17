import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapPage extends StatefulWidget {
  LatLng location;

  MapPage({super.key, required this.location});

  @override
  State<MapPage> createState() => MapSampleState();
}

class MapSampleState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();




  List<LatLng> locais = [
    LatLng(-9.747830788944716, -36.63182896410414),
    LatLng(-9.747127959300029, -36.63329314554841),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          markers: getMarkers(),
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.location.latitude, widget.location.longitude),
            zoom: 15,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }

  getMarkers() {
    Set<Marker> markers = {};

    for (var local in locais) {
      markers.add(
        Marker(
          markerId: MarkerId(DateTime.now().millisecondsSinceEpoch.toString()),
          position: local,
          infoWindow: InfoWindow(title: 'Local 1', snippet: 'teste'),
        ),
      );
    }

    return markers;
  }
}
