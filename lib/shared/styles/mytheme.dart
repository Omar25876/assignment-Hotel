import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme{
  static ThemeData lightTheme = ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: const ColorScheme(
              primary: mainBluePrimaryColor,
              brightness: Brightness.light,
              onPrimary: Colors.white,
              secondary:blackColor,
              onSecondary: blackColor,
              error: redColor,
              onError: redColor,
              background: Colors.white,
              onBackground: Colors.white,
              surface: Colors.white,
              onSurface: blackColor,

        ),



  );
}