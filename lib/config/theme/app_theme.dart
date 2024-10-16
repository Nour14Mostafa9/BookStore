import 'package:design_pattern/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme(){
  return ThemeData(
    primaryColor: AppColor.primary,
    iconTheme: IconThemeData(
      color: AppColor.iconColor,
      size: 32
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColor.primary,
        fontSize: 22,
        fontWeight: FontWeight.bold
      )
    ),
      textTheme: TextTheme(
          displaySmall:GoogleFonts.lora(
              fontSize: 13,
              color: AppColor.normal,
            fontWeight: FontWeight.bold,
          ) ,
          bodySmall:GoogleFonts.lora(
            fontSize: 13,
            color: AppColor.normal,
            fontWeight: FontWeight.bold,
            height: 1.8
          ) ,
          headlineSmall:GoogleFonts.lora(
              fontSize: 18,
              color: AppColor.primary,
              fontWeight: FontWeight.bold
          ) ,
          bodyMedium:GoogleFonts.lora(
              fontSize: 25,
              color: AppColor.primary,
              fontWeight: FontWeight.bold
          ) ,
          labelLarge:GoogleFonts.lora(
              color: Colors.white,
              fontSize: 20
          )
      )
  );
}