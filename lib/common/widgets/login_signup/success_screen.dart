import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_e_commerce/common/styles/spacing_styles.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SdpSuccessScreenOne extends StatelessWidget {
  const SdpSuccessScreenOne(
      {super.key,
      required this.image,
      required this.tittle,
      required this.subTitle,
      required this.onPressed});
  final String image, tittle, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SdpSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Image
              Image(
                image: AssetImage(image),
                width: SdpHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: SdpSizes.spaceBtwSections),

              //Title & SubTitle
              Text(tittle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SdpSizes.spaceBtwItems),
              Text(subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SdpSizes.spaceBtwItems),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed,
                    child: const Text(SdpTexts.tContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
