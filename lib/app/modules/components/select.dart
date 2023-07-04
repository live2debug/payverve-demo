// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payverve/app/modules/util/app.dart';
import 'package:payverve/app/modules/util/func.dart';
import 'package:payverve/app/modules/util/mixins.dart';

class Select<T> extends StatefulWidget {
  final List<SelectOption<T>> options;
  final T? initialValue;
  Select({
    super.key,
    required List<SelectOption<T>> options,
    this.initialValue,
    Function(T value)? onChange,
  }) : options = Set.from(options).toList().cast() {
    if (onChange != null) {
      for (final option in this.options) {
        option.addListener(onChange);
      }
    }
  }

  @override
  State<Select> createState() {
    return SelectState<T>();
  }
}

class SelectState<T> extends State<Select> {
  int _selectedIndex = -1;
  List<SelectOption>? _options;

  @override
  void initState() {
    super.initState();
    _options = widget.options;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: App.BORDER_RADIUS_SMALL,
      onTap: () {
        Get.dialog(
          GestureDetector(
            onTap: () => Get.back(),
            child: Scaffold(
              backgroundColor: Get.theme.dialogTheme.shadowColor,
              body: Padding(
                padding: App.EDGE_INSETS_X,
                child: Center(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColorDark,
                        borderRadius: App.BORDER_RADIUS_SMALL,
                      ),
                      constraints: BoxConstraints.loose(Size.fromHeight(300)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const TextField(
                            decoration: InputDecoration(
                              filled: false,
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search',
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) =>
                                  widget.options[index].render(context),
                              itemCount: widget.options.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Get.theme.inputDecorationTheme.fillColor,
          borderRadius: App.BORDER_RADIUS_SMALL,
        ),
        child: Padding(
          padding: App.EDGE_INSETS,
          child: Row(
            children: [
              Icon(
                CupertinoIcons.arrowtriangle_down_fill,
                size: 13,
                color: Get.theme.inputDecorationTheme.labelStyle?.color,
              ),
              App.boxWidth(),
              Expanded(child: Text("Nigeria")),
            ],
          ),
        ),
      ),
    );
  }

  T? get selectedValue => null;
}

class SelectOption<T> with ReactiveObjectMixin<T> {
  final T value;
  final Widget child;

  SelectOption({
    required this.value,
    required this.child,
    Function(T value)? onTap,
  }) {
    if (onTap != null) addListener(onTap);
  }

  Widget render(BuildContext context) {
    return InkWell(
      onTap: () => notify(value),
      child: Expanded(child: child),
    );
  }

  @override
  bool operator ==(other) => value == other;

  @override
  int get hashCode => value.hashCode;
}

class SelectController<T> {}
