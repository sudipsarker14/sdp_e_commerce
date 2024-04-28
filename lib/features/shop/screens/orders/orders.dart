import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/features/shop/screens/orders/widget/orders_list.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';

class SdpOrdersScreen extends StatelessWidget {
  const SdpOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appbar
      appBar: SdpAppbar(
          title: Text('My Orders',
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(SdpSizes.defaultSpace),

        /// Orders
        child: SdpOrderListItems(),
      ),
    );
  }
}
