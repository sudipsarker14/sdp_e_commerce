import 'package:flutter_e_commerce/features/authentication/screens/login/login.dart';
import 'package:flutter_e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_e_commerce/features/authentication/screens/password_configuration/forget_passwprd.dart';
import 'package:flutter_e_commerce/features/authentication/screens/signup/signup.dart';
import 'package:flutter_e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_e_commerce/features/personalization/screens/address/address.dart';
import 'package:flutter_e_commerce/features/personalization/screens/profile/profile_screen.dart';
import 'package:flutter_e_commerce/features/personalization/screens/settings/settings.dart';
import 'package:flutter_e_commerce/features/shop/screens/cart/cart.dart';
import 'package:flutter_e_commerce/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_e_commerce/features/shop/screens/home/home.dart';
import 'package:flutter_e_commerce/features/shop/screens/orders/orders.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_rating/product_rating.dart';
import 'package:flutter_e_commerce/features/shop/screens/store/store.dart';
import 'package:flutter_e_commerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:flutter_e_commerce/routes/routes.dart';
import 'package:get/get.dart';

class SdpAppRoutes {
  static final pages = [
    GetPage(name: SdpRoutes.home, page: () => const SdpHomeScreen()),
    GetPage(name: SdpRoutes.store, page: () => const SdpStoreScreen()),
    GetPage(name: SdpRoutes.favourites, page: () => const SdpWishListScreen()),
    GetPage(name: SdpRoutes.settings, page: () => const SdpSettingsScreen()),
    GetPage(
        name: SdpRoutes.productReviews, page: () => const SdpProductRating()),
    GetPage(name: SdpRoutes.order, page: () => const SdpOrdersScreen()),
    GetPage(name: SdpRoutes.checkout, page: () => const SdpCheckOutScreen()),
    GetPage(name: SdpRoutes.cart, page: () => const SdpCartScreen()),
    GetPage(name: SdpRoutes.userProfile, page: () => const SdpProfileScreen()),
    GetPage(
        name: SdpRoutes.userAddress, page: () => const SdpUserAddressScreen()),
    GetPage(name: SdpRoutes.signup, page: () => const SignupScreen()),
    GetPage(
        name: SdpRoutes.verifyEmail, page: () => const SdpVerifyEmailScreen()),
    GetPage(name: SdpRoutes.signIn, page: () => const LoginScreen()),
    GetPage(
        name: SdpRoutes.forgetPassword, page: () => const SdpForgetPassword()),
    GetPage(name: SdpRoutes.onBoading, page: () => const SdpOnBoardingScreen()),
    // Add more GetPage entries as needed
  ];
}
