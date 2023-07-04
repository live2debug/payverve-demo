import 'package:get/get.dart';

class HomeController extends GetxController {
  final _busy = false.obs;

  final _current = 0.obs;

  void busy(bool busy) {
    _busy(busy);
  }

  int get current => _current.value;

  set current(int current) {
    _current(current);
  }

  bool get shouldShowActionButton => current == 3;

  bool get isBusy => _busy.value;
}
