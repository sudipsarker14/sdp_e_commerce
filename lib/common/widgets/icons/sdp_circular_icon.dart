import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import '../../../utils/constants/colors.dart';

class SdpCircularIcon extends StatelessWidget {
  ///A custom Circular Icon widget with a background color.
  ///
  /// Properties are:
  ///  Container [width], [height], & [backgroundColor].
  ///
  /// Icons's [size], [color] & [onPressed]
  const SdpCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = SdpSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : SdpHelperFunctions.isDarkMode(context)
                ? SdpColors.black.withOpacity(0.9)
                : SdpColors.white.withOpacity(0.9),
      ),
      child: IconButton(
          onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}
