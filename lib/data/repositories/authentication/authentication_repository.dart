import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_commerce/features/authentication/screens/login/login.dart';
import 'package:flutter_e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_e_commerce/navigation_menu/nevigation_menu.dart';
import 'package:flutter_e_commerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:flutter_e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_e_commerce/utils/exceptions/format_exceptions.dart';
import 'package:flutter_e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SdpAuthenticationRepository extends GetxController {
  static SdpAuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app lunch

  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

/*
  /// Function to Show Relevent Screen
  screenRedirect() async {
    // Local Storage
    if (kDebugMode) {
      print('========================== Get Storage ================');
      print(deviceStorage.read('IsFirstTime'));
    }
*/
  /// Function to Show Relevent Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const SdpNavigationMenu());
      } else {
        Get.offAll(() => SdpVerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() =>
              const LoginScreen()) // Redirect to Login Screen if not the first time
          : Get.offAll(
              const SdpOnBoardingScreen()); // Redirect to OnBoarding Screen if it's the first time
    }
  }

  /* -------------------------Email & Password sign-in--------------------------*/

  // [Email Authentication] - Log In

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SdpFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SdpFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SdpFormatException();
    } on PlatformException catch (e) {
      throw SdpPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [Email Authentication] - Register

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SdpFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SdpFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SdpFormatException();
    } on PlatformException catch (e) {
      throw SdpPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [Email Verification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw SdpFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SdpFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SdpFormatException();
    } on PlatformException catch (e) {
      throw SdpPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [Re Authentication] - Re Authenticate User

  // [Email Authentication] - Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw SdpFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SdpFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SdpFormatException();
    } on PlatformException catch (e) {
      throw SdpPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /* -------------------------Federated identity & social sign-in ------------------*/

  // [Google Authentication] - Google

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw SdpFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SdpFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SdpFormatException();
    } on PlatformException catch (e) {
      throw SdpPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [Fasebook Authentication] - Facebook

  /* ------------------------ / end federated identity & social sign-in ----------------*/

  // [LogoutUser] - Valid for any authenticaton

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw SdpFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SdpFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SdpFormatException();
    } on PlatformException catch (e) {
      throw SdpPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // [DeleteUser] - Remove user Auth and firestore Account.
}
