// ignore_for_file: must_be_immutable
import 'package:hive_flutter/hive_flutter.dart';
import 'package:payverve/app/data/models/app_model.dart';
import 'package:payverve/app/data/models/firebase/event.dart';
import 'package:payverve/app/data/models/firebase/mixin.dart';

abstract class FBModel<T extends FBModel<T>> extends AppModel
    with FBMixin, HiveObjectMixin
    implements FBModelListener {
  FBModel({required created, required updated, String? uid})
      : super(created: created, updated: updated, uid: uid) {
    addModelEventListener(this);
  }


  @override
  void onSet() async {
    await save();
  }

  @override
  void onUpdate() async {
    await save();
  }

  @override
  void onDelete() async {
    await delete();
  }

  @override
  Map prepareUpdate(Map map) {
    if (map.containsKey('created')) {
      map.remove('created');
    }
    if (map.containsKey('_uid')) {
      map.remove('_uid');
    }

    return map;
  }
}
