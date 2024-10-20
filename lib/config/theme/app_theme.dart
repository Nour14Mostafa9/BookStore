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
              color: Colors.grey,
            fontWeight: FontWeight.bold,
          ) ,
          bodySmall:GoogleFonts.lora(
            fontSize: 15,
            color: Colors.grey,
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

enum AppTheme{
  lightMode("Light Mode"),
  darkMode("Dark Mode");
  final String name;
  const AppTheme(this.name);
}

final appThemeData ={
  AppTheme.lightMode:ThemeData(
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
            fontSize: 14,
            color: Colors.black26,
            fontWeight: FontWeight.bold,

          ) ,
          bodySmall:GoogleFonts.lora(
              fontSize: 15,
              color: AppColor.darkMode,
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
  ),
  AppTheme.darkMode: ThemeData(

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.darkMode,
      ),
      primaryColor: AppColor.primary,
      iconTheme: IconThemeData(
          color: AppColor.iconColor,
          size: 32
      ),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColor.darkMode,
      appBarTheme: AppBarTheme(
          color: AppColor.darkMode ,
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
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ) ,
          bodySmall:GoogleFonts.lora(
              fontSize: 15,
              color: AppColor.lightMode,
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
              color: AppColor.darkMode,
              fontSize: 20
          )
      )
  ),

};
