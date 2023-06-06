import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:master_class/config/themes/app_colors.dart';

mixin SubThemeData{
  TextTheme getTextThemes(){
    return GoogleFonts.quicksandTextTheme(
      const TextTheme(bodyLarge: TextStyle(
        fontWeight: FontWeight.w500
      ),
      bodyMedium:TextStyle(
        fontWeight: FontWeight.w500
      ) )
      
    );
  }

  IconThemeData getIconTheme(){
    return const IconThemeData(color: onSurfaceTextColor, size: 36);
  }
}