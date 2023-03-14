import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_map/view/home/home.dart';

class HomeC extends GetxController {
  var ismark = 'all'.obs;
  var marker = <Marker>[].obs;

  List<Marker> markerlist() {
    if (ismark.value == 'hospital') {
      return marker.value = [
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
      return marker.value = [
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
  }
}
