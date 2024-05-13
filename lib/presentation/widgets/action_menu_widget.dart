import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';

class ActionMenuIcon extends StatelessWidget {
  final void Function() onPressed;
  final Widget icon;
  final Color? backgroundColor;
  final double radius;
  final Border? border;

  const ActionMenuIcon({
    super.key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor = Colors.white,
    this.radius = 20,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: Dimen.smallSpace),
      decoration: BoxDecoration(border: border, borderRadius: BorderRadius.circular(radius)),
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: radius,
        child: IconButton(onPressed: onPressed, padding: EdgeInsets.zero, icon: icon, color: primaryColor),
      ),
    );
  }
}

class ActionMenuButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? backgroundColor;
  final BorderSide? side;
  final Icon? icon;
  final String title;
  final TextStyle? titleStyle;

  const ActionMenuButton({
    super.key,
    required this.onTap,
    this.backgroundColor,
    this.side,
    this.icon,
    required this.title,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: icon!,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: side,
      ),
      label: Text(title, style: titleStyle),
    );
  }
}
