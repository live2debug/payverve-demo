import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payverve/app/modules/components/icon_and_text.dart';
import 'package:payverve/app/modules/util/app.dart';
import 'package:payverve/app/modules/util/func.dart';

class SignupView extends GetView {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: App.GAP * 2),
            Text(
              'Payverve',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Get.theme.primaryColorLight,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            Center(
              child: Image.asset(
                App.imageAsset('payverve'),
                width: 50,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Signup',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white.withAlpha(130),
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: App.GAP),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(App.GAP),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    FutureBuilder(
                        future: App.loadCountries(context),
                        builder: (context, snapshot) {
                          var data = <DropdownMenuItem<Object>>[];
                          if (snapshot.hasData) {
                            data = [
                              for (final e in snapshot.data!)
                                DropdownMenuItem(
                                  child: Text(
                                    e['name'],
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  value: e['code'],
                                )
                            ];
                          }
                          return DropdownButtonFormField(
                            items: data,
                            onChanged: (value) {},
                            hint: Text("Select country"),
                            dropdownColor: Get.theme.primaryColorDark,
                            isExpanded: true,
                          );
                        }),
                    App.boxHeight(),
                    TextField(
                      decoration: InputDecoration(
                        label: IconAndText(
                          const Icon(Icons.person),
                          Text('Lastname'),
                        ),
                      ),
                    ),
                    App.boxHeight(),
                    TextField(
                      decoration: InputDecoration(
                        label: IconAndText(
                          const Icon(Icons.person),
                          Text('Firstname'),
                        ),
                      ),
                    ),
                    App.boxHeight(),
                    TextField(
                      decoration: InputDecoration(
                        label: IconAndText(
                          const Icon(Icons.alternate_email_rounded),
                          Text('Email'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
