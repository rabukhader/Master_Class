import 'package:flutter/material.dart';


class Dialogs{
  static final Dialogs _singleton = Dialogs._internal();
  Dialogs._internal();

  factory Dialogs(){
    return _singleton;
  }
  static Widget questionStartDialogue({required VoidCallback onTap}){
    return AlertDialog(
      backgroundColor: Color(0xFF3AC3CB),
      content: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text("data")

                        ),
                      ),
                    ), 
      actions: [
        TextButton(onPressed: onTap, child: const Text("Confirm", style: TextStyle(color: Color(0XFff85187), fontWeight: FontWeight.w500, fontFamily: AutofillHints.familyName), )),
      ],
    );
  }
}

// Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Hi...",
//             style: TextStyle(
//               fontSize: 25, fontWeight: FontWeight.bold
//             ),
//         5  ),
//           Text(
//             "Please login before you start"
//           ),
//         ],
//       ),