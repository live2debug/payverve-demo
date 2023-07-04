import 'package:flutter/material.dart';
import 'package:payverve/app/modules/util/app.dart';

const secondary = Color(0xff00ccff);

const primary = Color(0xFF0054D2);
const backgroundColor = Color(0xFF0F1A2A);
const foregroundColor = Color(0xFFE0E0E0);
const primaryLight = Color(0xFF0066FF);
const primaryDark = Color(0xFF0144A8);

final defaultDarkTheme = ThemeData(
  primaryColor: primary,
  primaryColorLight: primaryLight,
  primaryColorDark: primaryDark,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: primary,
    onPrimary: foregroundColor,
    secondary: secondary,
    onSecondary: foregroundColor,
    error: Color(0xFFD63E33),
    onError: foregroundColor,
    background: backgroundColor,
    onBackground: foregroundColor,
    surface: primaryLight,
    onSurface: foregroundColor,
  ),
  scaffoldBackgroundColor: backgroundColor,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: secondary.withAlpha(10),
    border: const OutlineInputBorder(
      borderRadius: App.BORDER_RADIUS,
      borderSide: BorderSide.none,
      gapPadding: 0,
    ),
    prefixIconColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.focused)) {
        return secondary;
      }
      return primary;
    }),
    focusColor: secondary,
    floatingLabelStyle: TextStyle(
      color: secondary,
      fontWeight: FontWeight.w500,
    ),
  ),
);
