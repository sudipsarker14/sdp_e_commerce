import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class SdpRoundedContainer extends StatelessWidget {
  const SdpRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = SdpSizes.cardRadiusLg,
    this.padding,
    this.showBorder = false,
    this.borderColor = SdpColors.white,
    this.child,
    this.backgroundColor = SdpColors.white,
    this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final bool showBorder;
  final Color borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
