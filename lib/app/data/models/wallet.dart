// ignore_for_file: must_be_immutable

import 'package:hive/hive.dart';
import 'package:payverve/app/data/models/app_model.dart';
import 'package:payverve/app/data/models/model_constants.dart';
import 'package:payverve/app/data/models/firebase/model.dart';

class AppWallet extends FBModel<AppWallet> {
  static const _i = AppModel.startIndex;

  @HiveField(_i)
  String? privateKey;

  @HiveField(_i + 1)
  String? publicKey;

  @HiveField(_i + 2)
  String? name;

  @HiveField(_i + 3)
  String? desc;

  @HiveField(_i + 4)
  int? balance;

  @HiveField(_i + 5)
  String? ownerUID;

  AppWallet({
    super.created,
    super.updated,
    super.uid,
    this.name,
    this.balance,
    this.desc,
    this.privateKey,
    this.publicKey,
    this.ownerUID,
  });

  @override
  String get collectionName => 'wallets';

  @override
  void subscript(String key, value) {}

  @override
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'created': created,
      'updated': updated,
      'name': name,
      'balance': balance,
      'privateKey': privateKey,
      'publicKey': publicKey,
      'desc': desc,
      'ownerUID': ownerUID,
    };
  }

  @override
  int get typeId => ModelConstants.WALLET_ID;

  @override
  AppWallet read(BinaryReader reader) {
    return AppModel.fromMap(reader.read(), this);
  }
}
