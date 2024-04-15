import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SdpSingleAddress extends StatelessWidget {
  const SdpSingleAddress({
    super.key,
    required this.selectedAddress,
  });
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return SdpRoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(SdpSizes.md),
      showBorder: true,
      backgroundColor: selectedAddress
          ? SdpColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? SdpColors.darkerGrey
              : SdpColors.grey,
      margin: const EdgeInsets.only(bottom: SdpSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? FontAwesomeIcons.circleCheck : null,
              color: selectedAddress
                  ? dark
                      ? SdpColors.light
                      : SdpColors.dark.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: SdpSizes.sm / 2),
              const Text(
                '(+123) 456 7890',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: SdpSizes.sm / 2),
              const Text(
                '82356, Timmy Coves, South Liana, Maine, 87665, USA',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              const SizedBox(height: SdpSizes.sm / 2),
            ],
          )
        ],
      ),
    );
  }
}
