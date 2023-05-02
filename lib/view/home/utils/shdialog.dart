import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Shdialog {
  static void shdialogWidget(
    context,
    String name,
    String kategori,
    String jamLayanan,
    String kontak,
    String link,
  ) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(name)),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  kategori,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  jamLayanan,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () => launchUrl(
                    Uri.parse('tel:$kontak'),
                    mode: LaunchMode.externalNonBrowserApplication,
                  ),
                  child: Row(
                    children: [
                      Text(
                        kontak,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: const Icon(
                          Icons.contact_support,
                          size: 10.0,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () => launchUrl(
                    Uri.parse(link),
                    mode: LaunchMode.externalNonBrowserApplication,
                  ),
                  child: const Text(
                    "Lokasi Faskes",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
