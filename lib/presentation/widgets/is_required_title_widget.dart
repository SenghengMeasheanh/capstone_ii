import 'package:flutter/material.dart';

class IsRequiredTitle extends StatelessWidget {
  final Widget? title;
  final EdgeInsetsGeometry? margin;
  final bool required;

  const IsRequiredTitle({
    super.key,
    this.title,
    this.margin,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Title
          title!,
          // * Space
          const SizedBox(width: 4),
          // * Required Icon
          if (required) const Icon(Icons.star, size: 11, color: Colors.red),
        ],
      ),
    );
  }
}
