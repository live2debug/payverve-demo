import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payverve/app/modules/components/user_header.dart';
import 'package:payverve/app/modules/util/app.dart';
import 'package:payverve/app/modules/widgets/lists.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: const Color(0xFF0F2545),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/payverve.png',
                  width: 20,
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Payverve',
                    style: TextStyle(
                        fontSize: 20, color: Colors.white.withAlpha(200)),
                  ),
                ),
                const Spacer(),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SizedBox.square(
                        dimension: 17,
                        child: CircleAvatar(
                          backgroundColor: Get.theme.colorScheme.secondary,
                          child: const Text(
                            '9+',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const DrawerButton()
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Header(),
                const SizedBox(height: App.GAP),
                WalletsList(),
                const SizedBox(height: App.GAP),
                const SizedBox(height: App.GAP),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: getCard(
                        'Sent',
                        '09',
                        'N20',
                        Get.theme.primaryColorLight.withAlpha(90),
                        Icons.arrow_upward,
                        Colors.teal[400]!,
                      ),
                    ),
                    Expanded(
                      child: getCard(
                        'Sent',
                        '09',
                        'N20',
                        Get.theme.colorScheme.secondary.withAlpha(60),
                        Icons.arrow_downward,
                        Colors.amberAccent[400]!,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card getCard(String title, String body, String subTitle, Color color,
      IconData icon, Color iconColor) {
    return Card(
      color: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white.withAlpha(100),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                body,
                style: const TextStyle(
                  fontSize: 70,
                ),
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: Get.theme.colorScheme.onPrimary.withAlpha(100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
