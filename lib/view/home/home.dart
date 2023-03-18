import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:learn_flutter_map/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final homeC = Get.put(HomeC());

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
              homeC.ismark.value = 'all';
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
              homeC.ismark.value = "hospital";
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
          Obx(() => MarkerLayer(markers: homeC.markerlist())),
        ],
      ),
    );
  }
}
