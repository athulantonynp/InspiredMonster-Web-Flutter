import 'package:flutter/material.dart';

import 'ColorUtils.dart';

class ThemeUtils{
  final ThemeData darkTheme = _buildDarkTheme();
  final ThemeData lightTheme= _buildLightTheme();

  static ThemeData _buildDarkTheme() {
  return new ThemeData(
    primaryColor:  ColorUtils.fromHex("#212121"),
    accentColor: ColorUtils.fromHex("#757575"),
    backgroundColor:ColorUtils.fromHex("#121212") ,
    bottomAppBarColor: ColorUtils.fromHex("#181d24"),
    buttonColor: Colors.black,
    canvasColor: Colors.transparent,
    indicatorColor: Colors.white,
    selectedRowColor: ColorUtils.fromHex("#181818"),
    fontFamily: 'Roboto'
  );
}

 static ThemeData _buildLightTheme() {
  return ThemeData(
    primaryColor:  ColorUtils.fromHex("#FFFFFF"),
    accentColor: ColorUtils.fromHex("#F6F6F6"),
    backgroundColor:ColorUtils.fromHex("#FFFFFF") ,
    canvasColor: Colors.transparent,
      bottomAppBarColor: ColorUtils.fromHex("#181d24"),
    buttonColor: Colors.white,
    indicatorColor: Colors.black,
      selectedRowColor: ColorUtils.fromHex("#CFCFCF"),
    fontFamily: 'Roboto',
  );
}
}