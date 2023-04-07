import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDialUtils {
  final VoidCallback semuaFasilitas;
  final VoidCallback praktikDokter;
  final VoidCallback hospital;
  final VoidCallback apotik;
  final VoidCallback puskesmas;
  final VoidCallback klinik;

  SpeedDialUtils({
    required this.semuaFasilitas,
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
          child: const Icon(Icons.assignment_turned_in),
          backgroundColor: const Color(0xFF801E48),
          onTap: semuaFasilitas,
          label: 'Default',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: const Color(0xFF801E48),
        ),
        SpeedDialChild(
          child: const Icon(Icons.assignment_turned_in),
          backgroundColor: const Color(0xFF801E48),
          onTap: praktikDokter,
          label: 'Praktik Dokter',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: const Color(0xFF801E48),
        ),
        SpeedDialChild(
          child: const Icon(Icons.assignment_turned_in),
          backgroundColor: const Color(0xFF801E48),
          onTap: hospital,
          label: 'Rumah Sakit',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: const Color(0xFF801E48),
        ),
        SpeedDialChild(
          child: const Icon(Icons.assignment_turned_in),
          backgroundColor: const Color(0xFF801E48),
          onTap: apotik,
          label: 'Apotik',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: const Color(0xFF801E48),
        ),
        SpeedDialChild(
          child: const Icon(Icons.assignment_turned_in),
          backgroundColor: const Color(0xFF801E48),
          onTap: puskesmas,
          label: 'Puskesmas',
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.0),
          labelBackgroundColor: const Color(0xFF801E48),
        ),
        SpeedDialChild(
          child: const Icon(Icons.assignment_turned_in),
          backgroundColor: const Color(0xFF801E48),
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
