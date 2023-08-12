import 'package:flutter/material.dart';

ThemeData themeData=ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.red,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.red,
      textStyle: const TextStyle(color: Colors.red),
      side: const BorderSide(color: Colors.red,width: 2.0),
      disabledForegroundColor: Colors.red.withOpacity(0.38),
    ),
    
  ),
  inputDecorationTheme:  InputDecorationTheme(
    border: outlineInputBorder,  
    errorBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      textStyle: const TextStyle(
        fontSize: 18.0,

      ),
      disabledBackgroundColor: Colors.grey,
    ),
  ),
  canvasColor: Colors.red,
  primarySwatch: Colors.red,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
    toolbarTextStyle: TextStyle(color: Colors.black)
  )
);

OutlineInputBorder outlineInputBorder= const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    );