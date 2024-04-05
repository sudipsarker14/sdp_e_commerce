import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:flutter_e_commerce/common/widgets/login_signup/social_buttons.dart';
import 'package:flutter_e_commerce/features/authentication/screens/signup/widgets/signup_from.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(SdpSizes.defaultSpace),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Tittle
          Text(SdpTexts.signupTitle,
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: SdpSizes.spaceBtwSections),

          //Form
          const SdpSignUpForm(),

          const SizedBox(height: SdpSizes.spaceBtwSections),

          //Divider
          SdpFormDivider(dividerText: SdpTexts.orSignInWith.capitalize!),
          const SizedBox(height: SdpSizes.spaceBtwSections),

          // Social Buttons
          const SdpSocialButtons(),
        ]),
      )),
    );
  }
}
