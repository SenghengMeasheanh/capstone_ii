import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final Function() onTap;
  final String text;
  final IconData icon;
  const CustomButtonWithIcon({super.key, required this.onTap, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(
        text,
        style: CustomTextStyle.titleTextStyle(),
      ),
    );
  }
}
