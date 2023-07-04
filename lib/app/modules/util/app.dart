// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';

class App {
  static const double GAP = 15;

  static const EDGE_INSETS_ZERO = EdgeInsets.zero;
  static const EDGE_INSETS = EdgeInsets.all(GAP);
  static const EDGE_INSETS_X = EdgeInsets.only(left: GAP, right: GAP);
  static const EDGE_INSETS_Y = EdgeInsets.only(top: GAP, bottom: GAP);
  static const EDGE_INSETS_RIGHT = EdgeInsets.only(right: GAP);
  static const EDGE_INSETS_LEFT = EdgeInsets.only(left: GAP);
  static const EDGE_INSETS_TOP = EdgeInsets.only(top: GAP);
  static const EDGE_INSETS_BOTTOM = EdgeInsets.only(bottom: GAP);

  static const BORDER_RADIUS = BorderRadius.all(Radius.circular(10));
  static const BORDER_RADIUS_SMALL = BorderRadius.all(Radius.circular(5));

  static String imageAsset(String filename, [ext = 'png']) =>
      "assets/images/$filename.$ext";
  static SizedBox boxHeight([final double height = GAP]) {
    return SizedBox(height: height);
  }

  static SizedBox boxWidth([final double width = GAP]) {
    return SizedBox(width: width);
  }

  static Future<dynamic> _loadAssetJson(
      BuildContext context, String filename) async {
    return jsonDecode(await DefaultAssetBundle.of(context)
        .loadString("assets/json/$filename.json"));
  }

  static Future loadCountries(BuildContext context) async {
    return _loadAssetJson(context, "countries");
  }

  static Future loadCurrencies(BuildContext context) async {
    return _loadAssetJson(context, "currencies");
  }
}
