import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';

class SdpHomeCategories extends StatelessWidget {
  const SdpHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return SdpVerticalImageText(
              image: SdpImages.shoeIcon,
              title: 'Shoes',
              onTap: () {},
            );
          }),
    );
  }
}
