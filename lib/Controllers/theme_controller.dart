import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_class/config/themes/app_dark_theme.dart';
import 'package:master_class/config/themes/app_light_theme.dart';

class ThemeController extends GetxController{

  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit(){
    super.onInit();
    initializeThemeData();
  }

initializeThemeData(){
  _darkTheme= DarkTheme().buildDarkTheme();
  _lightTheme= LightTheme().builLightTheme();
}

ThemeData get darkTheme => _darkTheme;
ThemeData get lightTheme => _lightTheme;
}