import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';

class SdpAllProducts extends StatelessWidget {
  const SdpAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SdpAppbar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SdpSizes.defaultSpace),
          child: SdpSortableProducts(),
        ),
      ),
    );
  }
}
