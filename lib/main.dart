import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Map"),
          actions: const [],
        ),
        body: ListView(
          children: [
            const Center(
              child: Text(
                "INI CONTOH GIS",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            SizedBox(
              height: 400,
              child: FlutterMap(
                options: MapOptions(center: LatLng(3.5275209, 98.6510574)),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(3.530434, 98.6710611),
                        builder: (context) => const Icon(
                          Icons.pin_drop,
                        ),
                      ),
                      Marker(
                        point: LatLng(3.527794, 98.6610892),
                        builder: (context) => GestureDetector(
                          onTap: () async {
                            bool confirm = false;
                            await showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Apotik'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Text('Apotik Blablabla'),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(
                            Icons.pin_drop,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
