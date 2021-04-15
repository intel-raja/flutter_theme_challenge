import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }
  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData.light().copyWith(
          primaryColor: Colors.green,
          textTheme: TextTheme(
            headline1: GoogleFonts.caveat(color: Colors.lightGreen),
            headline2: GoogleFonts.caveat(color: Colors.lightGreen),
            headline3: GoogleFonts.caveat(color: Colors.lightGreen),
            headline4: GoogleFonts.caveat(color: Colors.lightGreen),
            headline5: GoogleFonts.caveat(color: Colors.lightGreen),
            headline6: GoogleFonts.caveat(color: Colors.lightGreen),
            subtitle1: GoogleFonts.caveat(color: Colors.lightGreen),
            subtitle2: GoogleFonts.caveat(color: Colors.lightGreen),
            bodyText1: GoogleFonts.caveat(color: Colors.lightGreen),
            bodyText2: GoogleFonts.caveat(color: Colors.lightGreen),
            caption: GoogleFonts.caveat(color: Colors.lightGreen),
            button: GoogleFonts.caveat(color: Colors.lightGreen),
            overline: GoogleFonts.caveat(color: Colors.lightGreen),
          ),
        );
      case ThemeType.Dark:
        return ThemeData.dark();
      case ThemeType.Other:
        return ThemeData();
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Other,
}
