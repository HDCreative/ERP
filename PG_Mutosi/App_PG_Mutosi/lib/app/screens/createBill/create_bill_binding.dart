import 'package:get/get.dart';
import 'package:mutosi/app/screens/createBill/create_bill_controller.dart';
import 'package:mutosi/app/screens/shop/shop_controller.dart';

class CreateBillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateBillController>(() => CreateBillController());
  }
}
