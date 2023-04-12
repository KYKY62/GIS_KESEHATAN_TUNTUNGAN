import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Shdialog {
  static void shdialogWidget(
    context,
    String name,
    String kategori,
    String link,
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
                Text(
                  "Kategori : $kategori",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
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
                    "Direction",
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
