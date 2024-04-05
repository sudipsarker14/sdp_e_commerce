import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/constants/text_strings.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';

class SdpResetPassword extends StatelessWidget {
  const SdpResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SdpSizes.defaultSpace),
          child: Column(
            children: [
              //Image
              Image(
                image: const AssetImage(SdpImages.deliveredEmailIllustration),
                width: SdpHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: SdpSizes.spaceBtwSections),

              //Title & SubTitle
              Text(SdpTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SdpSizes.spaceBtwItems),
              Text(SdpTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SdpSizes.spaceBtwItems),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(SdpTexts.done)),
              ),
              const SizedBox(height: SdpSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(SdpTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
