import 'package:flutter/material.dart';
import 'package:payverve/app/modules/components/select.dart';

class TestSelect extends StatelessWidget {
  const TestSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Select(
            options: <SelectOption<String>>[
              SelectOption(value: 'Nigeria', child: const Text('Nigeria')),
              SelectOption(
                  value: 'United States', child: const Text('United States')),
              SelectOption(value: 'England', child: const Text('England')),
            ],
          ),
        ),
      ),
    );
  }
}
