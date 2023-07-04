import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payverve/app/modules/util/app.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<StatefulWidget> createState() {
    return HeaderState();
  }
}

class HeaderState extends State<Header> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: App.EDGE_INSETS,
      child: Center(
        child: Column(
          children: [
            SizedBox.square(
              dimension: 80,
              child: CircleAvatar(
                backgroundColor: Get.theme.primaryColorLight,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage:
                      Image.asset('assets/images/avatar.jpg').image,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Rose Bucket',
              style: TextStyle(
                fontSize: 27,
                color: Colors.white70,
              ),
            ),
            const Text(
              'Member since 2021 Nov. 11th',
              style: TextStyle(
                fontSize: 9,
                color: Colors.white38,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
