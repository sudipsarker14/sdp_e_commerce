import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/images/sdp_circular_image.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class SdpUserProfileTile extends StatelessWidget {
  const SdpUserProfileTile({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SdpCircularImage(
          image: SdpImages.user, width: 50, height: 50, padding: 0),
      title: Text('Sudip Sarker',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: SdpColors.white)),
      subtitle: Text('support@email.com',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: SdpColors.white)),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.edit, color: SdpColors.white)),
    );
  }
}
