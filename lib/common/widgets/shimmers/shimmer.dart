import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class SdpShimmerEffect extends StatelessWidget {
  const SdpShimmerEffect({
    Key? key,
    required this.width,
    required this.height,
    this.redius = 15,
    this.color,
  }) : super(key: key);

  final double width, height, redius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? SdpColors.darkerGrey : SdpColors.white),
          borderRadius: BorderRadius.circular(redius),
        ),
      ),
    );
  }
}
