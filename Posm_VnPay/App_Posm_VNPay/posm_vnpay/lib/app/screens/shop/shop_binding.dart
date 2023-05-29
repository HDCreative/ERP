import 'package:get/get.dart';
import 'package:posm_vnpay/app/screens/shop/shop_controller.dart';

class ShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopController>(() => ShopController());
  }
}
