import 'package:get/get.dart';

import '../controllers/customer_info_controller.dart';

class CustomerInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerInfoController>(
      () => CustomerInfoController(),
    );
  }
}
