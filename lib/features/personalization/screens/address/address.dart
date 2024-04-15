import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/features/personalization/screens/address/add_new_address.dart';
import 'package:flutter_e_commerce/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SdpUserAddressScreen extends StatelessWidget {
  const SdpUserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          () => const SdpAddNewAddressScreen(),
        ),
        backgroundColor: SdpColors.primary,
        child: const Icon(FontAwesomeIcons.plus, color: SdpColors.white),
      ),
      appBar: SdpAppbar(
        showBackArrow: true,
        title:
            Text('Address', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SdpSizes.defaultSpace),
          child: Column(
            children: [
              SdpSingleAddress(selectedAddress: false),
              SdpSingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
    );
  }
}
