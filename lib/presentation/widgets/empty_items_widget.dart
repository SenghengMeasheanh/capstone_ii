import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:capstone_ii/helper/helper_export.dart';

class EmptyItems extends StatelessWidget {
  const EmptyItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      Assets.lottieEmptyItems,
      width: 250,
      height: 250,
      repeat: false,
    );
  }
}
