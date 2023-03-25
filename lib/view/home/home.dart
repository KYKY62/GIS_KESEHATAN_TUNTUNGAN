import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:learn_flutter_map/controller/home_controller.dart';
import 'package:learn_flutter_map/view/home/utils/shdialog.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final homeC = Get.put(HomeC());
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Map"),
        actions: const [],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              db
                  .collection('layananKesehatan')
                  .where('type', isEqualTo: 'apotik')
                  .get()
                  .then((value) {
                for (var docSnapshot in value.docs) {
                  docSnapshot['type'] == 'apotik';
                  print(docSnapshot['type']);
                }
              });
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              db
                  .collection('layananKesehatan')
                  .where('type', isEqualTo: 'hospital')
                  .get()
                  .then((value) {
                for (var docSnapshot in value.docs) {
                  docSnapshot['type'] == 'hospital';
                  print(docSnapshot['type']);
                }
              });
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.local_hospital,
                color: Colors.red,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              homeC.ismark.value = 'klinik';
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.local_police,
                color: Colors.red,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              homeC.ismark.value = 'puskesmas';
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.family_restroom,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(3.524420, 98.620612),
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          PolygonLayer(
            polygonCulling: false,
            polygons: [
              Polygon(
                points: homeC.kecamatan,
                color: Colors.blueAccent.withOpacity(0.4),
                borderColor: Colors.blueAccent.withOpacity(0.4),
                borderStrokeWidth: 2,
                holePointsList: [[]],
              ),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: db.collection('layananKesehatan').snapshots(),
            builder: (context, snapshot) {
              List<Marker> markers = [];
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              // for (var doc in snapshot.data!.docs[1]['type']) {
              //   if (doc['type'] == 'hospital') {
              //     for (var doc in snapshot.data!.docs) {
              //       print(doc.data());
              //       GeoPoint geoPoint = doc['latlong'];
              //       Marker marker = Marker(
              //         point: LatLng(geoPoint.latitude, geoPoint.longitude),
              //         builder: (context) => GestureDetector(
              //           onTap: () => Shdialog.shdialogWidget(
              //             context,
              //             doc['title'],
              //             doc['description'],
              //           ),
              //           child: const Icon(
              //             Icons.pin_drop,
              //           ),
              //         ),
              //       );
              //       markers.add(marker);
              //     }
              //   } else {
              //     if (doc['type'] == 'apotik') {
              //       print(doc.data());
              //       GeoPoint geoPoint = doc['latlong'];
              //       Marker marker = Marker(
              //         point: LatLng(geoPoint.latitude, geoPoint.longitude),
              //         builder: (context) => GestureDetector(
              //           onTap: () => Shdialog.shdialogWidget(
              //             context,
              //             doc['title'],
              //             doc['description'],
              //           ),
              //           child: const Icon(
              //             Icons.pin_drop,
              //           ),
              //         ),
              //       );
              //       markers.add(marker);
              //     }
              //   }
              // }
              // ! Belum Fix
              for (var doc in snapshot.data!.docs) {
                GeoPoint geoPoint = doc['latlong'];
                Marker marker = Marker(
                  point: LatLng(geoPoint.latitude, geoPoint.longitude),
                  builder: (context) => GestureDetector(
                    onTap: () => Shdialog.shdialogWidget(
                      context,
                      doc['title'],
                      doc['description'],
                    ),
                    child: const Icon(
                      Icons.pin_drop,
                    ),
                  ),
                );
                markers.add(marker);
              }
              return MarkerLayer(markers: markers);
            },
          ),
        ],
      ),
    );
  }
}
