import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/theme/widget_themes/appbar_theme.dart';
import 'package:flutter_e_commerce/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:flutter_e_commerce/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:flutter_e_commerce/utils/theme/widget_themes/chip_theme.dart';
import 'package:flutter_e_commerce/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:flutter_e_commerce/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:flutter_e_commerce/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter_e_commerce/utils/theme/widget_themes/text_theme.dart';

class SdpAppTheme {
  SdpAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: Colors.grey,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: SdpTextTheme.lightTextTheme,
    chipTheme: SdpChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: SdpAppBarTheme.lightAppBarTheme,
    checkboxTheme: SdpCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: SdpBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: SdpElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: SdpOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: SdpTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: Colors.grey,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: SdpTextTheme.darkTextTheme,
    chipTheme: SdpChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: SdpAppBarTheme.darkAppBarTheme,
    checkboxTheme: SdpCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: SdpBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: SdpElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: SdpOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: SdpTextFormFieldTheme.darkInputDecorationTheme,
  );
}
