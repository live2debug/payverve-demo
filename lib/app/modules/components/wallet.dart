import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payverve/app/data/models/wallet.dart';
import 'package:payverve/app/modules/components/icon_and_text.dart';
import 'package:payverve/app/modules/util/app.dart';

class Wallet extends StatelessWidget {
  final AppWallet wallet;

  const Wallet({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.primaryColor.withAlpha(50),
        borderRadius: App.BORDER_RADIUS,
      ),
      child: Padding(
        padding: App.EDGE_INSETS,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconAndText(const Icon(Icons.wallet), Text(wallet.name!)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [IconAndText(const Icon(Icons.arrow_upward), Text(""))],
            )
          ],
        ),
      ),
    );
  }
}
