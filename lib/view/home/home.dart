import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:learn_flutter_map/controller/home_controller.dart';
import 'package:learn_flutter_map/view/home/utils/shdialog.dart';
import 'package:learn_flutter_map/view/home/utils/speed_dial_utils.dart';

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
      floatingActionButton: SpeedDialUtils(
        semuaFasilitas: () => homeC.filter.value = 'default',
        praktikDokter: () => homeC.filter.value = 'praktik dokter',
        hospital: () => homeC.filter.value = 'hospital',
        apotik: () => homeC.filter.value = 'apotik',
        puskesmas: () => homeC.filter.value = 'puskesmas',
        klinik: () => homeC.filter.value = 'klinik',
      ).speedDialUtils(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: FlutterMap(
        nonRotatedChildren: const [],
        options: MapOptions(
          center: LatLng(3.524420, 98.620612),
          interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
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
          Obx(
            () => StreamBuilder<QuerySnapshot>(
              stream: homeC.filter.value == 'default'
                  ? db.collection('layananKesehatan').snapshots()
                  : db
                      .collection('layananKesehatan')
                      .where('type', isEqualTo: homeC.filter.value)
                      .snapshots(),
              builder: (context, snapshot) {
                List<Marker> markers = [];
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

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
          )
        ],
      ),
    );
  }
}

Future<List<DocumentSnapshot>> getDataByType(String type) async {
  var snapshots = await FirebaseFirestore.instance
      .collection('layananKesehatan')
      .where('type', isEqualTo: type)
      .get();
  return snapshots.docs;
}
