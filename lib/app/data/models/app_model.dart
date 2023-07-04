import 'package:hive_flutter/hive_flutter.dart';

abstract class AppModel {
  static const int startIndex = 3;
  @HiveField(0)
  // ignore: prefer_final_fields
  String? _uid;

  @HiveField(1)
  int created;

  @HiveField(2)
  int updated;

  AppModel({
    this.created = -1,
    this.updated = -1,
    String? uid,
  }) : _uid = uid;

  String? get uid => _uid;

  Map<String, dynamic> toMap();

  void operator []=(String key, dynamic value) {
    switch (key) {
      case 'created':
      case 'uid':
      case '_uid':
        break;
      case 'updated':
        updated = value;
      default:
        subscript(key, value);
    }
  }

  dynamic operator [](String key) {
    return toMap()[key];
  }

  void subscript(String key, dynamic value);

  static T fromMap<T extends AppModel>(Map<String, dynamic> map, T model) {
    for (final key in map.keys) {
      model[key] = map[key];
    }
    return model;
  }
}
