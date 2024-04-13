import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_rating/widgets/progress_indicator_and_rating.dart';

class SdpOverallProductRating extends StatelessWidget {
  const SdpOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              SdpRatingProgressIndicator(text: '5', value: 1.0),
              SdpRatingProgressIndicator(text: '4', value: 0.8),
              SdpRatingProgressIndicator(text: '3', value: 0.6),
              SdpRatingProgressIndicator(text: '2', value: 0.4),
              SdpRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        ),
      ],
    );
  }
}
