import 'package:get/get.dart';
import 'package:mutosi/app/screens/record/record_controller.dart';

class RecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordController>(() => RecordController());
  }
}
