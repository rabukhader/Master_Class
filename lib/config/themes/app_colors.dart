import 'package:flutter/material.dart';
import 'package:master_class/config/themes/app_dark_theme.dart';
import 'package:master_class/config/themes/app_light_theme.dart';
import 'package:master_class/config/themes/ui_parameters.dart';

const Color onSurfaceTextColor= Colors.white;

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

LinearGradient mainGradient(BuildContext context) =>
    UIParameters.isDarkMode(context) ? mainGradientDark : mainGradientLight;
