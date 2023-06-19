import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_class/config/themes/app_dark_theme.dart';
import 'package:master_class/config/themes/app_light_theme.dart';
import 'package:master_class/config/themes/ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
  colors: [primaryLightColorLight, primaryColorLight],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const mainGradientDark = LinearGradient(
  colors: [primaryDarkColorDark, primaryColorDark],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient mainGradient() =>
    UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;

Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode()
    ? const Color(0xFF2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);

Color answerSelectedColor() => UIParameters.isDarkMode()
    ? Theme.of(Get.context!).cardColor.withOpacity(0.5)
    : Theme.of(Get.context!).primaryColor;

Color answerBorderColor()=> UIParameters.isDarkMode()?
  const Color.fromARGB(255, 20, 46, 158):
  const Color.fromARGB(255, 221, 221, 221);