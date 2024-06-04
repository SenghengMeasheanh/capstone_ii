import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemUniversityFilter extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function() onTap;
  final Function() onDeleteTap;
  const ItemUniversityFilter({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 11),
      onDeleted: isSelected ? onDeleteTap : null,
      label: Text(title, style: CustomTextStyle.bodyTextStyle()),
      selected: isSelected,
      onSelected: (value) {
        onTap();
      },
      selectedColor: primaryColor,
      labelStyle: CustomTextStyle.bodyTextStyle(color: isSelected ? Colors.white : Colors.black),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimen.defaultRadius),
        side: const BorderSide(color: Colors.black),
      ),
      deleteIcon: isSelected
          ? SvgPicture.asset(
              Assets.iconClose,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            )
          : const SizedBox.shrink(),
      showCheckmark: false,
    );
  }
}
