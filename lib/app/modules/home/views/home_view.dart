import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payverve/app/modules/components/circle_indicator.dart';
import 'package:payverve/app/modules/components/primary_button.dart';
import 'package:payverve/app/modules/home/views/signup_view.dart';
import 'package:payverve/app/modules/home/views/test_select.dart';
import 'package:payverve/app/modules/util/app.dart';
import 'package:payverve/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const TestSelect();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (int index) {
                    controller.current = index;
                  },
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withAlpha(150),
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Image.asset(
                          'assets/images/payverve.png',
                          width: 150,
                          height: 150,
                        ),
                        Text(
                          'Payverve',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Get.theme.primaryColorLight,
                            fontSize: 50,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/debit-card.png',
                          width: 150,
                          // height: 150,
                        ),
                        const Text(
                          'Imaging moving money around as easily as texting.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/shield.png',
                          width: 150,
                          // height: 150,
                        ),
                        const Text(
                          'With 100% security and reliability.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/time.png',
                          width: 150,
                          // height: 150,
                        ),
                        const Text(
                          'And of course, in almost no time at all.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Obx(
                () => CircleIndicator(
                  count: 4,
                  onTap: (index) {},
                  current: controller.current,
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
              SizedBox(height: App.GAP),
              Obx(
                () => AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: controller.shouldShowActionButton ? 1 : 0,
                  child: PrimaryButton(
                    text: 'Join payverve',
                    onTap: () {
                      controller.busy(true);
                      Future.delayed(const Duration(seconds: 2),
                          () => Get.offAll(const SignupView()));
                    },
                    busy: controller.isBusy,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
