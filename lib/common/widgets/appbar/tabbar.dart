import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/device/device_utility.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';

class SdpTabBar extends StatelessWidget implements PreferredSizeWidget {
  ///If you want to add the background color to tabs you have to wrap them in Material widget.
  ///To do that we need [PreferredSizeWidget] Widget and that's why created custom class.[PreferredSizeWidget]
  const SdpTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? SdpColors.black : SdpColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: SdpColors.primary,
        labelColor: dark ? SdpColors.white : SdpColors.primary,
        unselectedLabelColor: SdpColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SdpDeviceUtils.getAppBarHeight());
}
