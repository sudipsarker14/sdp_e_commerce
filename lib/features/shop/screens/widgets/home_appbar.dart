import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class SdpHomeAppBar extends StatelessWidget {
  const SdpHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SdpAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(SdpTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: SdpColors.grey)),
          Text(SdpTexts.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: SdpColors.white)),
        ],
      ),
      actions: [
        SdpCartCounterIcon(
          onPressed: () {},
          iconColor: SdpColors.white,
        )
      ],
    );
  }
}
