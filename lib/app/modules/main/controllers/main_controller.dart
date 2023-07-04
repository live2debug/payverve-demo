import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final scaffKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffKey.currentState!.closeDrawer();
  }
}
