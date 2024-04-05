import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';

class SdpShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: SdpColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: SdpColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
