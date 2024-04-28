import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/shop/screens/cart/cart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';

class SdpCartCounterIcon extends StatelessWidget {
  const SdpCartCounterIcon({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const SdpCartScreen()),
            icon: Icon(FontAwesomeIcons.bagShopping, color: iconColor)),
        Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: SdpColors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text('2',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: SdpColors.white, fontSizeFactor: 0.8)),
              ),
            ))
      ],
    );
  }
}
