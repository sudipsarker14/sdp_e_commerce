import 'package:flutter/widgets.dart';
import 'package:flutter_e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_e_commerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/helpers/network_manager.dart';
import 'package:flutter_e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter_e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SdpForgetPasswordController extends GetxController {
  static SdpForgetPasswordController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      SdpFullScreenLoader.openLoadingDialog(
          "Processing your request...", SdpImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await SdpNetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        SdpFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        // Remove Loader
        SdpFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await SdpAuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      SdpFullScreenLoader.stopLoading();

      // Show Success Screen
      SdpLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);

      // Redirect
      Get.to(() => SdpResetPassword(email: email.text.trim()));
    
    } catch (e) {
      // Remove Loader
      SdpFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      SdpLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordresetEmail(String email) async {
    try {
      // Start Loading
      SdpFullScreenLoader.openLoadingDialog(
          "Processing your request...", SdpImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await SdpNetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        SdpFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await SdpAuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      // Remove Loader
      SdpFullScreenLoader.stopLoading();

      // Show Success Screen
      SdpLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);
    
    } catch (e) {
       // Remove Loader
      SdpFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      SdpLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
