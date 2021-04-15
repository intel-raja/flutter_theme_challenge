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
            headline1: GoogleFonts.caveat(color: Colors.black, fontSize: 48),
            headline2: GoogleFonts.caveat(color: Colors.black, fontSize: 48),
            headline3: GoogleFonts.caveat(color: Colors.black, fontSize: 48),
            headline4: GoogleFonts.caveat(color: Colors.black, fontSize: 48),
            headline5: GoogleFonts.caveat(color: Colors.black, fontSize: 48),
            headline6: GoogleFonts.caveat(color: Colors.black, fontSize: 28),
            subtitle1: GoogleFonts.caveat(color: Colors.black, fontSize: 23),
            subtitle2: GoogleFonts.caveat(color: Colors.black, fontSize: 23),
            bodyText1: GoogleFonts.caveat(color: Colors.black, fontSize: 22),
            bodyText2: GoogleFonts.caveat(color: Colors.black, fontSize: 22),
            caption: GoogleFonts.caveat(color: Colors.black, fontSize: 22),
            button: GoogleFonts.caveat(color: Colors.black, fontSize: 22),
            overline: GoogleFonts.caveat(color: Colors.black, fontSize: 22),
          ),
        );
      case ThemeType.Dark:
        return ThemeData.dark().copyWith(
          primaryColor: Colors.black,
          textTheme: TextTheme(
            headline1: GoogleFonts.dosis(color: Colors.white, fontSize: 48),
            headline2: GoogleFonts.dosis(color: Colors.white, fontSize: 48),
            headline3: GoogleFonts.dosis(color: Colors.white, fontSize: 48),
            headline4: GoogleFonts.dosis(color: Colors.white, fontSize: 48),
            headline5: GoogleFonts.dosis(color: Colors.white, fontSize: 48),
            headline6: GoogleFonts.dosis(color: Colors.white, fontSize: 28),
            subtitle1: GoogleFonts.dosis(color: Colors.white, fontSize: 23),
            subtitle2: GoogleFonts.dosis(color: Colors.white, fontSize: 23),
            bodyText1: GoogleFonts.dosis(color: Colors.white, fontSize: 22),
            bodyText2: GoogleFonts.dosis(color: Colors.white, fontSize: 22),
            caption: GoogleFonts.dosis(color: Colors.white, fontSize: 22),
            button: GoogleFonts.dosis(color: Colors.white, fontSize: 22),
            overline: GoogleFonts.dosis(color: Colors.white, fontSize: 22),
          ),
        );
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
