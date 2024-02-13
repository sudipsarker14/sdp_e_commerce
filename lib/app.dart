import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_e_commerce/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: SdpAppTheme.lightTheme,
      darkTheme: SdpAppTheme.darkTheme,
      home: const SdpOnBoardingScreen(),
    );
  }
}
