import 'package:flutter/material.dart';

class lightTheme {

  final _lightColor = _LightColor();

  late ThemeData theme ;

  lightTheme() {
// BURDA HERŞEYİN TEMASINI KODLAYABİLİRİZ 
    theme = ThemeData(
      appBarTheme: AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom:Radius.circular(20) )
        )
      ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
  backgroundColor: Colors.green),

// colorScheme: const ColorScheme.light()
  colorScheme: const ColorScheme.dark(),

  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.light(
      onPrimary: Colors.purple,
      onSecondary: _lightColor.blueMenia
    )
  ) ,

  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(Colors.green)
  ),

  textTheme: ThemeData.light().textTheme.copyWith(
    subtitle1: const TextStyle(
      fontSize:20,
      color: Colors.black
    )
  )
  );
  }
  
}

class _LightColor {
  final Color _textColor = Colors.red;
  final Color blueMenia = Color.fromARGB(95, 188, 245, 1);
}