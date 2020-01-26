import 'dart:async';

import 'package:flutter/material.dart';

import 'ColorUtils.dart';

class ThemeBloc {
  var isDark = true;

  final _themeController = StreamController<bool>();
  get changeTheme {
    isDark = !isDark;
    _themeController.sink.add(isDark);
  }

  get darkEnabled => _themeController.stream;

  get isDarkEnabled {
    return isDark;
  }
}

class ThemeUtils {
  final ThemeData darkTheme = _buildDarkTheme();
  final ThemeData lightTheme = _buildLightTheme();

  static ThemeData _buildDarkTheme() {
    return new ThemeData(
        primaryColor: ColorUtils.fromHex("#212121"),
        accentColor: ColorUtils.fromHex("#757575"),
        backgroundColor: ColorUtils.fromHex("#121212"),
        bottomAppBarColor: ColorUtils.fromHex("#181d24"),
        buttonColor: Colors.black,
        canvasColor: Colors.transparent,
        indicatorColor: Colors.white,
        selectedRowColor: ColorUtils.fromHex("#181818"),
        unselectedWidgetColor: Colors.black87,
        appBarTheme: AppBarTheme(
          elevation: 4
        ),
        fontFamily: 'Roboto');
  }

  static ThemeData _buildLightTheme() {
    return ThemeData(
      primaryColor: ColorUtils.fromHex("#FFFFFF"),
      accentColor: ColorUtils.fromHex("#F6F6F6"),
      backgroundColor: ColorUtils.fromHex("#F6F6F6"),
      canvasColor: Colors.transparent,
      bottomAppBarColor: ColorUtils.fromHex("#1A000000"),
      buttonColor: Colors.white,
      appBarTheme: AppBarTheme(
          elevation: 4
        ),
      indicatorColor: Colors.black,
      selectedRowColor: ColorUtils.fromHex("#CFCFCF"),
        unselectedWidgetColor: Colors.white70,
      fontFamily: 'Roboto',
    );
  }
}
