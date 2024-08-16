import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/loaders/animation_loader.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

// A utility class for managing a full-screen loaing dialog

class SdpFullScreenLoader {
  // Open a full-screen loading dialog with a givern text and animation
  // This method doesn't return anything
  //
  // Perameters:
  //   - text: The text to be displayed in the loading dialog
  //   - animation: The lottie animation to be shown
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context:
          Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
      barrierDismissible:
          false, // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable poping with the back button
        child: Container(
          color: SdpHelperFunctions.isDarkMode(Get.context!)
              ? SdpColors.dark
              : SdpColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            const SizedBox(height: 250), // Adjust the spacing as needed
            SdpAnimationLoaderWidget(text: text, animation: animation)
          ]),
        ),
      ),
    );
  }

  /// Stap the currently open loading dialog.
  /// This method doesn't return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); // Close the dialog using the Navigator
  }
}
