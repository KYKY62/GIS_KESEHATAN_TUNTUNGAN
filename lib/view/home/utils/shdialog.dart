import 'package:flutter/material.dart';

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
