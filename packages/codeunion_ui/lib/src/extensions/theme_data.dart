import 'package:codeunion_ui/codeunion_ui.dart';
import 'package:flutter/material.dart';

///Extension on Themedata that must be added to return the correct asset
extension ThemeX on ThemeData {
  ///Returns the correct CODEUNIONIcon based on the current theme
  CODEUNIONIcon get icons {
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return CODEUNIONIconsDark();
    } else {
      return  CODEUNIONIconsLight();
    }
  }
}
