import 'package:flutter_e_commerce/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class SdpGenaralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SdpNetworkManager());
  }
}
