import 'package:flutter/foundation.dart';
import 'package:flutter_e_commerce/features/authentication/screens/login/login.dart';
import 'package:flutter_e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SdpAuthenticationRepository extends GetxController {
  static SdpAuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app lunch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevent Screen
  screenRedirect() async {
    // Local Storage
    if (kDebugMode) {
      print('========================== Get Storage ================');
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const SdpOnBoardingScreen());
  }
}
