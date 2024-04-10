import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class SdpProfileMenu extends StatelessWidget {
  const SdpProfileMenu(
      {super.key,
      this.icon = Iconsax.arrow_right_34,
      required this.onPressed,
      required this.tittle,
      required this.value});

  final IconData icon;
  final VoidCallback onPressed;
  final String tittle, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: SdpSizes.spaceBtwItems / 1.5),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Text(tittle,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis)),
              Expanded(
                  flex: 5,
                  child: Text(value,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis)),
              Expanded(child: Icon(icon, size: 18)),
            ],
          ),
        ));
  }
}
