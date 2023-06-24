import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();
  Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }
  static Widget questionStartDialogue({required VoidCallback onTap}) {
    return AlertDialog(
      backgroundColor: Color(0xFF3AC3CB),
      content: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
              child: Text(
            "Please sign in before take a quiz. ",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900),
          )),
        ),
      ),
      actions: [
        Container(
            child: TextButton(
          onPressed: onTap,
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0XFff85187),
                  borderRadius: BorderRadius.circular(10)),
              width: 100,
              height: 60,
              child: Center(
                  child: const Text(
                "Confirm",
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Color(0XFff85187),
                  fontWeight: FontWeight.w500,
                  fontFamily: AutofillHints.familyName,
                  fontSize: 18,
                ),
              ))),
        ))
      ],
    );
  }
}
