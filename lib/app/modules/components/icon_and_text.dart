import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final Text text;
  final Icon icon;
  final double gap;
  const IconAndText(this.icon, this.text, {super.key, this.gap = 10});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [icon, SizedBox(width: gap / 3), text],
    );
  }
}
