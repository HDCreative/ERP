import 'package:get/get.dart';
import 'package:syngentaaudit/app/screens/kpis/kpi_controller.dart';

class KPIBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KPIController>(() => KPIController());
  }
}
