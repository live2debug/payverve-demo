import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onTap;
  final bool busy;
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.busy = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: busy ? null : onTap,
      child: busy
          ? SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Text(text),
      style: const ButtonStyle(
          elevation: MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(2000),
              ),
            ),
          ),
          padding: MaterialStatePropertyAll(EdgeInsets.all(20))),
    );
  }
}
