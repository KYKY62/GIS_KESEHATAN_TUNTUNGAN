import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_map/view/home/utils/shdialog.dart';

class HomeC extends GetxController {
  var ismark = 'all'.obs;
  var marker = <Marker>[].obs;
  final db = FirebaseFirestore.instance;

  List<Marker> markerlist() {
    db.collection('layananKesehatan').where('type', isEqualTo: 'bidan').get();
    if (ismark.value == 'hopstial') {
      return marker.value = [
        Marker(
          point: LatLng(3.4979292, 98.5757571),
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
      if (ismark.value == 'klinik') {
        return marker.value = [
          Marker(
            point: LatLng(3.4971974, 98.5761576),
            builder: (context) => GestureDetector(
              onTap: () => Shdialog.shdialogWidget(context, "Klinik Kesehatan",
                  "Klinik Bidan Erniwaty Sitanggang"),
              child: const Icon(
                Icons.pin_drop,
              ),
            ),
          ),
        ];
      }
      if (ismark.value == 'puskesmas') {
        return marker.value = [
          Marker(
            point: LatLng(3.4978845, 98.5785515),
            builder: (context) => GestureDetector(
              onTap: () => Shdialog.shdialogWidget(
                  context, "Puskesmas", "Poskesdes Tuntungan II"),
              child: const Icon(
                Icons.pin_drop,
              ),
            ),
          ),
        ];
      }
      return marker.value = [
        Marker(
          point: LatLng(3.4971974, 98.5761576),
          builder: (context) => GestureDetector(
            onTap: () => Shdialog.shdialogWidget(context, "Klinik Kesehatan",
                "Klinik Bidan Erniwaty Sitanggang"),
            child: const Icon(
              Icons.pin_drop,
            ),
          ),
        ),
        Marker(
          point: LatLng(3.4978845, 98.5785515),
          builder: (context) => GestureDetector(
            onTap: () => Shdialog.shdialogWidget(
                context, "Puskesmas", "Poskesdes Tuntungan II"),
            child: const Icon(
              Icons.pin_drop,
            ),
          ),
        ),
        Marker(
          point: LatLng(3.498430, 98.577097),
          builder: (context) => GestureDetector(
            onTap: () => Shdialog.shdialogWidget(context, "Apotik", "Apotik 1"),
            child: const Icon(
              Icons.pin_drop,
            ),
          ),
        ),
        Marker(
          point: LatLng(3.4979925, 98.5770773),
          builder: (context) => GestureDetector(
            onTap: () => Shdialog.shdialogWidget(context, "Apotik", "Apotik 2"),
            child: const Icon(
              Icons.pin_drop,
            ),
          ),
        ),
      ];
    }
  }

  List<LatLng> kecamatan = [
    LatLng(3.498013, 98.592526),
    LatLng(3.490933, 98.599929),
    LatLng(3.501195, 98.617098),
    LatLng(3.500989, 98.615761),
    LatLng(3.503144, 98.615659),
    LatLng(3.504889, 98.619257),
    LatLng(3.505299, 98.618846),
    LatLng(3.507044, 98.624809),
    LatLng(3.515561, 98.623267),
    LatLng(3.518845, 98.625734),
    LatLng(3.517843, 98.627020),
    LatLng(3.517903, 98.628336),
    LatLng(3.516768, 98.627499),
    LatLng(3.516052, 98.628396),
    LatLng(3.514798, 98.627558),
    LatLng(3.513305, 98.628336),
    LatLng(3.511991, 98.627618),
    LatLng(3.511514, 98.629652),
    LatLng(3.508469, 98.628695),
    LatLng(3.508358, 98.630190),
    LatLng(3.504919, 98.631338),
    LatLng(3.505051, 98.630278),
    LatLng(3.504214, 98.631073),
    LatLng(3.503508, 98.630013),
    LatLng(3.502715, 98.632045),
    LatLng(3.499789, 98.632176),
    LatLng(3.499050, 98.633446),
    LatLng(3.499050, 98.631965),
    LatLng(3.498099, 98.633975),
    LatLng(3.497571, 98.633023),
    LatLng(3.496568, 98.634240),
    LatLng(3.497465, 98.634716),
    LatLng(3.496620, 98.635245),
    LatLng(3.497247, 98.636687),
    LatLng(3.493775, 98.635610),
    LatLng(3.493990, 98.634871),
    LatLng(3.490610, 98.636964),
    LatLng(3.489411, 98.635763),
    LatLng(3.488182, 98.645123),
    LatLng(3.490763, 98.644630),
    LatLng(3.490733, 98.645831),
    LatLng(3.493007, 98.646046),
    LatLng(3.492976, 98.646847),
    LatLng(3.496018, 98.645954),
    LatLng(3.496018, 98.645954),
    LatLng(3.498311, 98.647524),
    LatLng(3.495822, 98.648294),
    LatLng(3.497082, 98.649956),
    LatLng(3.496959, 98.650880),
    LatLng(3.495853, 98.651834),
    LatLng(3.496990, 98.653620),
    LatLng(3.496222, 98.655067),
    LatLng(3.499080, 98.656021),
    LatLng(3.500647, 98.655498),
    LatLng(3.503351, 98.657838),
    LatLng(3.503935, 98.657468),
    LatLng(3.504027, 98.658423),
    LatLng(3.504580, 98.658977),
    LatLng(3.506670, 98.658669),
    LatLng(3.508053, 98.659531),
    LatLng(3.508145, 98.649402),
    LatLng(3.508852, 98.649464),
    LatLng(3.508790, 98.643491),
    LatLng(3.509528, 98.643245),
    LatLng(3.510849, 98.642537),
    LatLng(3.512140, 98.643707),
    LatLng(3.513461, 98.644322),
    LatLng(3.514752, 98.644322),
    LatLng(3.515547, 98.647656),
    LatLng(3.517084, 98.648303),
    LatLng(3.517145, 98.648795),
    LatLng(3.518682, 98.649195),
    LatLng(3.520034, 98.649103),
    LatLng(3.520928, 98.648944),
    LatLng(3.521119, 98.649449),
    LatLng(3.523657, 98.649127),
    LatLng(3.524538, 98.648761),
    LatLng(3.524657, 98.648574),
    LatLng(3.525075, 98.648836),
    LatLng(3.525635, 98.648552),
    LatLng(3.529553, 98.649142),
    LatLng(3.530107, 98.649339),
    LatLng(3.530178, 98.649217),
    LatLng(3.531003, 98.649246),
    LatLng(3.531322, 98.648806),
    LatLng(3.531478, 98.648358),
    LatLng(3.531788, 98.648333),
    LatLng(3.531866, 98.648221),
    LatLng(3.531868, 98.648113),
    LatLng(3.531379, 98.647686),
    LatLng(3.531142, 98.648069),
    LatLng(3.530492, 98.648159),
    LatLng(3.530052, 98.647538),
    LatLng(3.529750, 98.647779),
    LatLng(3.529558, 98.647608),
    LatLng(3.529867, 98.646483),
    LatLng(3.529375, 98.646653),
    LatLng(3.529333, 98.646095),
    LatLng(3.530571, 98.645611),
    LatLng(3.531869, 98.645023),
    LatLng(3.531911, 98.644784),
    LatLng(3.532214, 98.644543),
    LatLng(3.5342144, 98.6426469),
    LatLng(3.529580, 98.636243),
    LatLng(3.532635, 98.633569),
    LatLng(3.532616, 98.628984),
    LatLng(3.537080, 98.629102),
    LatLng(3.537679, 98.615787),
    LatLng(3.547441, 98.619304),
    LatLng(3.547365, 98.620367),
    LatLng(3.549411, 98.620671),
    LatLng(3.549449, 98.616078),
    LatLng(3.549940, 98.616082),
    LatLng(3.550056, 98.612471),
    LatLng(3.549798, 98.612361),
    LatLng(3.549860, 98.611522),
    LatLng(3.550307, 98.611521),
    LatLng(3.550571, 98.606056),
    LatLng(3.546209, 98.598533),
    LatLng(3.544266, 98.597882),
    LatLng(3.540373, 98.593084),
    LatLng(3.539583, 98.595873),
    LatLng(3.537938, 98.597489),
    LatLng(3.538602, 98.600277),
    LatLng(3.538223, 98.601006),
    LatLng(3.535692, 98.601386),
    LatLng(3.533099, 98.602432),
    LatLng(3.532941, 98.600974),
    LatLng(3.531915, 98.602292),
    LatLng(3.529197, 98.599351),
    LatLng(3.529360, 98.597609),
    LatLng(3.512218, 98.601716),
    LatLng(3.507726, 98.598846),
    LatLng(3.505382, 98.596497),
    LatLng(3.499847, 98.595780),
    LatLng(3.499717, 98.593431),
    LatLng(3.497698, 98.592453),
  ];
}
