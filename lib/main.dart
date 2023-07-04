// ignore_for_file: constant_identifier_names

import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payverve/app/modules/themes/default/dark.dart';

import 'app/routes/app_pages.dart';

extension ColorExtension on Color {
  List<double> getHSL() {
    List<double> c = [red, green, blue].map((e) => e / 255).toList();

    double r = c[0], g = c[1], b = c[2];

    double min = c[0],
        max = c[2],
        delta = max - min,
        h = 0,
        s = 0,
        l = (min + max) / 2;

    if (max == r) {
      h = ((g - b) / delta) % 6;
    } else if (max == g) {
      h = (b - r) / delta + 2;
    } else {
      h = (r - g) / delta + 4;
    }
    h = h.round().toDouble() * 60;
    if (h < 0) h += 360;

    s = delta == 0 ? 0 : delta / (1 - (2 * l - 1).abs());

    var hsl = [h, s * 100, l * 100];
    dev.log(hsl.toString());
    return hsl;
  }

  static Color fromHSL(double h, double s, double l, double alpha) {
    s /= 100;
    l /= 100;
    final k = (n) => (n + h / 30) % 12;
    final a = s * min(l, 1 - l);
    final f = (n) => l - a * max(-1, min(k(n) - 3, min(9 - k(n), 1)));
    return Color.fromARGB(alpha.toInt(), (255 * f(0)).toInt(),
        (255 * f(8)).toInt(), (255 * f(4)).toInt());
  }

  Color saturation(double percent) {
    List<double> hsl = getHSL();
    return fromHSL(hsl[0], percent, hsl[1], alpha.toDouble());
  }

  Color light(double percent) {
    List<double> hsl = getHSL();
    return fromHSL(hsl[0], hsl[1], percent, alpha.toDouble());
  }
}

void main() {
  runApp(
    GetMaterialApp(
      title: "Payverve",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: defaultDarkTheme,
    ),
  );
}
