import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payverve/app/modules/util/app.dart';

class CircleIndicator extends StatelessWidget {
  // ignore: constant_identifier_names
  static const double DEFAULT_SIZE = 6;

  final Axis axis;
  final int count, current;
  final double size;
  final Function(int index) onTap;
  final Color color;

  const CircleIndicator({
    super.key,
    required this.count,
    required this.onTap,
    this.axis = Axis.horizontal,
    this.current = 0,
    this.size = DEFAULT_SIZE,
    this.color = Colors.white,
  });

  const CircleIndicator.vertical({
    super.key,
    required this.count,
    this.current = 0,
    required this.onTap,
    this.size = DEFAULT_SIZE,
    this.color = Colors.white,
  }) : axis = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return axis == Axis.horizontal ? _horizontal() : _vertical();
  }

  Widget _horizontal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => InkWell(
          onTap: () => onTap(index),
          child: Padding(
            padding: const EdgeInsets.all(App.GAP / 4),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(90000)),
                color: color
                    .withAlpha(index == current ? 255 : 100),
              ),
              width: index == current ? size * 3 : size,
              height: size,
            ),
          ),
        ),
      ),
    );
  }

  Widget _vertical() {
    return Container();
  }
}
