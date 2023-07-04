import 'package:flutter/material.dart';

mixin ReactiveObjectMixin<T> {
  List<Function(T value)>? _listeners;

  addListener(Function(T value) listener) {
    _listeners ??= [];
    _listeners = {..._listeners!, listener}.toList();
  }

  removeListener(Function(T value) listener) {
    if (_listeners != null) _listeners!.remove(listener);
  }

  @protected
  notify(T value) {
    for (final listener in _listeners!) {
      listener(value);
    }
  }
}
