import 'package:flutter/material.dart';

class ShdialogInfo {
  static void shdialogWidget(
    context,
    String title,
    String nameFirst,
    String nameSecond,
  ) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  nameFirst,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  nameSecond,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  'assets/logoUinsu.png',
                  width: 20,
                  height: 150,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
