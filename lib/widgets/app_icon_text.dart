import 'package:flutter/material.dart';

class AppIconText extends StatelessWidget {
  final Icon icon;
  final Widget Text;
  const AppIconText({super.key,
  required this.icon,
  required this.Text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
         width: 4,
        ),
        Text,
      ],
    );
  }
}