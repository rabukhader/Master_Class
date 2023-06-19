import 'package:flutter/material.dart';
import 'package:master_class/config/themes/app_colors.dart';
import 'package:master_class/config/themes/ui_parameters.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  const AnswerCard(
      {super.key,
      required this.answer,
      this.isSelected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected?answerSelectedColor():answerBorderColor(),
          ),
            borderRadius: UIParameters.cardBorderRadius,
            color: isSelected ? answerSelectedColor() : Theme.of(context).cardColor),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected ? onSurfaceTextColor : null,
          ),
        ),
      ),
    );
  }
}
