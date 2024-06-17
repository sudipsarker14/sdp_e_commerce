import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/common/widgets/brands/brand_card.dart';
import 'package:flutter_e_commerce/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';

class SdpBrandProduct extends StatelessWidget {
  const SdpBrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SdpAppbar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SdpSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              SdpBrandCard(showBorder: true),
              SizedBox(height: SdpSizes.spaceBtwSections),
              SdpSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
