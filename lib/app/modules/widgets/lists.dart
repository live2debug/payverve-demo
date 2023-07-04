// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payverve/app/data/models/wallet.dart';
import 'package:payverve/app/modules/components/circle_indicator.dart';
import 'package:payverve/app/modules/util/app.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class WalletsList extends StatefulWidget {
  WalletsList({super.key});

  final listKey = GlobalKey<ScrollSnapListState>();

  static final __now = DateTime.now().microsecondsSinceEpoch;

  List<AppWallet> wallets = [
    AppWallet(
      balance: 12000,
      created: __now,
      updated: __now,
      desc: 'A wallet for school savings.',
      name: 'School savings',
      ownerUID: 'some-uid',
      privateKey: 'sdf69dsf9-adf780adsf7855',
      publicKey: '690ad6fd557ds8f58a0d5fsd78fs758sdfsf',
      uid: '89a9sdf698a8d9sf9daf',
    ),
    AppWallet(
      balance: 300,
      created: __now,
      updated: __now,
      desc: 'Wallet for misc. expenses.',
      name: 'Misc. Wallet',
      ownerUID: 'some-uid',
      privateKey: 'sdf69dsf9-adf780adsf7855',
      publicKey: '690ad6fd557ds8f58a0d5fsd78fs758sdfsf',
      uid: '89a9sdf698a8d9sf9daf',
    ),
  ];

  @override
  State<WalletsList> createState() {
    return _WalletsListState();
  }
}

class _WalletsListState extends State<WalletsList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            width: constraints.maxWidth,
            height: 150,
            child: ScrollSnapList(
              key: widget.key,
              scrollPhysics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: constraints.maxWidth - App.GAP * 2,
                  child: Padding(
                    padding: App.EDGE_INSETS_RIGHT,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: App.BORDER_RADIUS,
                        color: Get.theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                );
              },
              itemCount: widget.wallets.length,
              itemSize: constraints.maxWidth - App.GAP * 2,
              initialIndex: 0,
              onItemFocus: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        const SizedBox(
          height: App.GAP / 2,
        ),
        CircleIndicator(
          count: widget.wallets.length,
          current: currentIndex,
          onTap: (index) {},
        ),
      ],
    );
  }
}
