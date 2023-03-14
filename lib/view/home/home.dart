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
    if (homeC.ismark.value == 'hospital') {
      homeC.marker.value = [
        Marker(
          point: LatLng(3.5409601, 98.6777088),
          builder: (context) => GestureDetector(
            onTap: () => Shdialog.shdialogWidget(
                context, "Rumah Sakit", "Rumah Sakit 1"),
            child: const Icon(
              Icons.pin_drop,
            ),
          ),
        ),
      ];
    } else {
      homeC.marker.value = [
        Marker(
          point: LatLng(3.530434, 98.6710611),
          builder: (context) => GestureDetector(
            onTap: () => Shdialog.shdialogWidget(context, "Apotik", "Apotik 1"),
            child: const Icon(
              Icons.pin_drop,
            ),
          ),
        ),
        Marker(
          point: LatLng(3.527794, 98.6610892),
          builder: (context) => GestureDetector(
            onTap: () => Shdialog.shdialogWidget(context, "Apotik", "Apotik 1"),
            child: const Icon(
              Icons.pin_drop,
            ),
          ),
        ),
      ];
    }

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
              print(homeC.ismark.value);
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
              print(homeC.ismark.value);
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
              homeC.ismark.value = 'hospital';
              print(homeC.ismark.value);
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
              print(homeC.ismark.value);
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
          center: LatLng(3.5275209, 98.6510574),
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          Obx(() => MarkerLayer(
                markers: homeC.markerlist(),
              ))
        ],
      ),
    );
  }
}

class Shdialog {
  static void shdialogWidget(
    context,
    String name,
    String desc,
  ) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(desc),
              ],
            ),
          ),
        );
      },
    );
  }
}
