import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SdpAddNewAddressScreen extends StatelessWidget {
  const SdpAddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SdpAppbar(
        showBackArrow: true,
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SdpSizes.defaultSpace),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.user),
                      labelText: 'Name')),
              const SizedBox(height: SdpSizes.spaceBtwInputFields),
              TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.mobile),
                      labelText: 'Phone Number')),
              const SizedBox(height: SdpSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(FontAwesomeIcons.building),
                              labelText: 'Street'))),
                  const SizedBox(width: SdpSizes.spaceBtwInputFields),
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(FontAwesomeIcons.code),
                              labelText: 'Postal Code'))),
                ],
              ),
              const SizedBox(height: SdpSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(FontAwesomeIcons.city),
                              labelText: 'City'))),
                  const SizedBox(width: SdpSizes.spaceBtwInputFields),
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(FontAwesomeIcons.addressCard),
                              labelText: 'State'))),
                ],
              ),
              const SizedBox(height: SdpSizes.defaultSpace),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Save')))
            ],
          )),
        ),
      ),
    );
  }
}
