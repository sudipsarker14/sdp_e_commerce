import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/login_signup/success_screen.dart';
import 'package:flutter_e_commerce/features/authentication/screens/login/login.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/constants/text_strings.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SdpVerifyEmailScreen extends StatelessWidget {
  const SdpVerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
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
              Text(SdpTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SdpSizes.spaceBtwItems),
              Text('developer@email.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: SdpSizes.spaceBtwItems),
              Text(SdpTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SdpSizes.spaceBtwItems),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => SdpSuccessScreenOne(
                          image: SdpImages.staticSuccessIllustration,
                          tittle: SdpTexts.yourAccountCreatedTitle,
                          subTitle: SdpTexts.yourAccountCreatedSubTitle,
                          onPressed: () => Get.to(() => const LoginScreen()),
                        )),
                    child: const Text(SdpTexts.tContinue)),
              ),
              const SizedBox(height: SdpSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: const Text(SdpTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
