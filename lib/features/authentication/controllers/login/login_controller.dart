import 'package:flutter/widgets.dart';
import 'package:flutter_e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/helpers/network_manager.dart';
import 'package:flutter_e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter_e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SdpLogingController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(SdpUserController());
/*
  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }*/

  // -- Email and Password SignIn

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      SdpFullScreenLoader.openLoadingDialog(
          "Loggin you in", SdpImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await SdpNetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        SdpFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        SdpFullScreenLoader.stopLoading();
        return;
      }
      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authenticationentication
      /*final userCredential = */ await SdpAuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      SdpFullScreenLoader.stopLoading();

      // Redirect
      SdpAuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      SdpFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      SdpLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      SdpFullScreenLoader.openLoadingDialog(
          "Loggin you in", SdpImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await SdpNetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        SdpFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials =
          await SdpAuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      SdpFullScreenLoader.stopLoading();

      // Redirect
      SdpAuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      SdpFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      SdpLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
