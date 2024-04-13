import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/common/widgets/products/ratings/rating_indicator.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_rating/widgets/rating_progress_indicator.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_rating/widgets/user_review_card.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';

class SdpProductRating extends StatelessWidget {
  const SdpProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: const SdpAppbar(
          title: Text('Reviews & Ratings'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SdpSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Rating and reviews are varified and are from people who use the same type of device that you use."),
              const SizedBox(height: SdpSizes.spaceBtwItems),

              /// Overall Product Ratings
              const SdpOverallProductRating(),
              const SdpRatingBarIndicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: SdpSizes.spaceBtwSections),

              /// User Reviews List
              const SdpUserReviewCard(),
              const SdpUserReviewCard(),
              const SdpUserReviewCard(),
              const SdpUserReviewCard(),
              const SdpUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
