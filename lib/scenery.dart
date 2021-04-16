import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:provider/provider.dart';

import 'scenery_painter.dart';
import 'themes/custom_themes.dart';
import 'themes/my_theme.dart';

class Scenery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SceneryState();
}

class _SceneryState extends State<Scenery> {
  final _textAreaHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    final myTheme = Provider.of<MyTheme>(context, listen: false);
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          CustomPaint(
            foregroundPainter: SceneryPainter(
              skyColor:
                  CustomWidgetThemes.of(context).sceneryThemeData!.skyFillColor,
              waterColor: CustomWidgetThemes.of(context)
                  .sceneryThemeData!
                  .waterFillColor,
              mountainColor: CustomWidgetThemes.of(context)
                  .sceneryThemeData!
                  .mountainFillColor,
              textHeight: _textAreaHeight,
            ),
            child: Container(),
          ),
          if (CustomWidgetThemes.of(context).sceneryThemeData!.drawSun)
            RubberBand(
              child: CustomPaint(
                foregroundPainter: SunPainter(textHeight: _textAreaHeight),
                child: Container(),
              ),
            ),
          Positioned(
            bottom: 0,
            child: Container(
              height: _textAreaHeight,
              width: constraints.maxWidth,
              child: const SomeText(),
            ),
          ),
          if (CustomWidgetThemes.of(context).sceneryThemeData!.drawMoon)
            RubberBand(
              child: CustomPaint(
                foregroundPainter: MoonPainter(
                  textHeight: _textAreaHeight,
                  skyColor: CustomWidgetThemes.of(context)
                      .sceneryThemeData!
                      .skyFillColor,
                ),
                child: Container(),
              ),
            ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: constraints.maxWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: RadioListTile<ThemeType>(
                          activeColor: Theme.of(context).primaryColor,
                          contentPadding: EdgeInsets.symmetric(horizontal: 4),
                          title: const Text('Light'),
                          groupValue: myTheme.themeType,
                          value: ThemeType.Light,
                          onChanged: (ThemeType? mode) {
                            myTheme.setThemeType(ThemeType.Light);
                          }),
                    ),
                    Expanded(
                      child: RadioListTile<ThemeType>(
                        activeColor: Theme.of(context).primaryColor,
                        contentPadding: EdgeInsets.symmetric(horizontal: 4),
                        title: const Text('Dark'),
                        groupValue: myTheme.themeType,
                        value: ThemeType.Dark,
                        onChanged: (ThemeType? mode) {
                          myTheme.setThemeType(ThemeType.Dark);
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<ThemeType>(
                        activeColor: Theme.of(context).primaryColor,
                        contentPadding: EdgeInsets.symmetric(horizontal: 4),
                        title: const Text('Other'),
                        groupValue: myTheme.themeType,
                        value: ThemeType.Other,
                        onChanged: (ThemeType? mode) =>
                            myTheme.setThemeType(ThemeType.Other),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if ((CustomWidgetThemes.of(context).sceneryThemeData!.drawMoon ||
                  CustomWidgetThemes.of(context).sceneryThemeData!.drawSun) ==
              false)
            RubberBand(
              child: CustomPaint(
                foregroundPainter: SunPainter(textHeight: _textAreaHeight),
                child: Container(),
              ),
            ),
        ],
      ),
    );
  }
}

class SomeText extends StatelessWidget {
  const SomeText();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Flaiku',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          'Anonymous',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 8),
        Text(
          'Hello, Flutter Friend!',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'Welcome to Flutter Challenge',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'We hope you have fun :)',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
