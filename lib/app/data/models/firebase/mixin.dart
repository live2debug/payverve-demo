import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:payverve/app/data/models/firebase/event.dart';
import 'package:payverve/app/data/models/app_model.dart';

mixin FBMixin on AppModel {
  Set<FBModelListener>? _listeners;

  void _notifyDelete() {
    for (final l in _listeners!) {
      l.onDelete();
    }
  }

  void _notifySet() {
    for (final l in _listeners!) {
      l.onSet();
    }
  }

  void _notifyupdate() {
    for (final l in _listeners!) {
      l.onUpdate();
    }
  }

  void addModelEventListener(FBModelListener listener) {
    _listeners ??= {};
    _listeners!.add(listener);
  }

  void removeModelEventListener(FBModelListener listener) {
    _listeners != null && _listeners!.remove(listener);
  }

  DocumentReference _getRef() =>
      FirebaseFirestore.instance.doc(getDocumentPath());

  Future<void> update() async {
    Map map = prepareUpdate(toMap());
    map['updated'] = DateTime.now().millisecondsSinceEpoch;
    await _getRef().update(map as Map<Object, Object?>);
    _notifyupdate();
  }

  Future<void> set() async {
    final int nowMillis = DateTime.now().millisecondsSinceEpoch;
    DocumentReference ref = _getRef();
    if ((await ref.get()).exists) return;
    Map map = prepareSet(toMap());
    map['created'] = map['updated'] = nowMillis;
    await _getRef().set(map);
    _notifySet();
  }

  Future<void> delete() async {
    await _getRef().delete();
    _notifyDelete();
  }

  Map prepareSet(Map map) => map;

  Map prepareUpdate(Map map) => map;

  String getDocumentPath() => "$collectionName/$uid";

  String get collectionName;
  String? get uid;
}
