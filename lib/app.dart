import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
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

      /// Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen
      home: const Scaffold(
        backgroundColor: SdpColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
