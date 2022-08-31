import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'k_constant.dart';

class KStyle {
  KStyle._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: whiteColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
      ),
      titleTextStyle: const TextStyle(
        color: primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      elevation: 0,
      titleSpacing: 40,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        primary: secondaryColor,
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
        onSurface: secondaryColor.withOpacity(0.05),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.transparent,
      contentPadding: EdgeInsets.symmetric(horizontal: 13),
      hintStyle: TextStyle(
        color: whiteColor,
      ),
      labelStyle: TextStyle(
        color: whiteColor,
      ),
      errorStyle: TextStyle(
        color: Colors.redAccent,
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
      ),
    ),
  );
}
