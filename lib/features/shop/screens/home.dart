import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/shop/screens/widgets/home_appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';

class SdpHomeScreen extends StatelessWidget {
  const SdpHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SdpPrimaryHeaderContainer(
              child: Column(
                children: [
                  SdpHomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
