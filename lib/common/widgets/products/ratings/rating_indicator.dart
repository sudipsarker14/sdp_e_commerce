import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SdpRatingBarIndicator extends StatelessWidget {
  const SdpRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (_, __) =>
          const Icon(FontAwesomeIcons.solidStar, color: SdpColors.primary),
      rating: rating,
      itemSize: 20,
      unratedColor: SdpColors.grey,
    );
  }
}
