import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SdpTermsAndCondititionCheckbox extends StatelessWidget {
  const SdpTermsAndCondititionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(height: SdpSizes.spaceBtwItems),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: '${SdpTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: '${SdpTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? SdpColors.white : SdpColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? SdpColors.white : SdpColors.primary,
                    )),
            TextSpan(
                text: '${SdpTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: SdpTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? SdpColors.white : SdpColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? SdpColors.white : SdpColors.primary,
                    )),
          ]),
        )
      ],
    );
  }
}
