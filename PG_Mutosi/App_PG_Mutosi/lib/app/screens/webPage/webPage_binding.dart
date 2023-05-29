import 'package:get/get.dart';
import 'package:mutosi/app/screens/webPage/webPage_controller.dart';

class WebPageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WebPageController());
  }

}