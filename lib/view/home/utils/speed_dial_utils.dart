import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDialUtils {
  final VoidCallback praktikDokter;
  final VoidCallback hospital;
  final VoidCallback apotik;
  final VoidCallback puskesmas;
  final VoidCallback klinik;

  SpeedDialUtils({
    required this.praktikDokter,
    required this.hospital,
    required this.apotik,
    required this.puskesmas,
    required this.klinik,
  });

  Widget speedDialUtils() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 22),
      backgroundColor: const Color(0xFF801E48),
      visible: true,
      curve: Curves.bounceIn,
      renderOverlay: false,
      children: [
        SpeedDialChild(
          child: Image.asset("assets/ic_praktikDokter.png"),
          backgroundColor: const Color(0xFFFFFFFF),
          onTap: praktikDokter,
          label: 'Praktik Dokter',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: const Color(0xFF801E48),
        ),
        SpeedDialChild(
          child: Image.asset("assets/ic_hospital.png"),
          backgroundColor: const Color(0xFFFFFFFF),
          onTap: hospital,
          label: 'Rumah Sakit',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: const Color(0xFF801E48),
        ),
        SpeedDialChild(
          child: Image.asset("assets/ic_apotik.png"),
          backgroundColor: const Color(0xFFFFFFFF),
          onTap: apotik,
          label: 'Apotik',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: const Color(0xFF801E48),
        ),
        SpeedDialChild(
          child: Image.asset("assets/ic_puskesmas.png"),
          backgroundColor: const Color(0xFFFFFFFF),
          onTap: puskesmas,
          label: 'Puskesmas',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: const Color(0xFF801E48),
        ),
        SpeedDialChild(
          child: Image.asset("assets/ic_klinik.png"),
          backgroundColor: const Color(0xFFFFFFFF),
          onTap: klinik,
          label: 'Klinik',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: const Color(0xFF801E48),
        ),
      ],
    );
  }
}
