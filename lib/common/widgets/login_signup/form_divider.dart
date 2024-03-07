import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class SdpFormDivider extends StatelessWidget {
  const SdpFormDivider({super.key, required this.dividerText});

  final String dividerText;
  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
                color: dark ? SdpColors.darkGrey : SdpColors.grey,
                thickness: 0.5,
                indent: 60,
                endIndent: 5)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
            child: Divider(
                color: dark ? SdpColors.darkGrey : SdpColors.grey,
                thickness: 0.5,
                indent: 5,
                endIndent: 60)),
      ],
    );
  }
}
