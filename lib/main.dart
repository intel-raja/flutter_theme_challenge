import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme_chellenge/scenery.dart';
import 'package:flutter_theme_chellenge/themes/my_theme.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MyTheme>(
      create: (_) => MyTheme(),
      child: LayoutBuilder(
        builder: (context, constraints) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<MyTheme>(context);
    return ThemeProvider(
      initTheme: themeProvider.currentThemeData,
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          title: 'Theming Mini Challenge',
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.of(context),
          home: MyHomePage(title: 'Theming Mini Challenge'),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: Scenery(),
      ),
    );
  }
}
