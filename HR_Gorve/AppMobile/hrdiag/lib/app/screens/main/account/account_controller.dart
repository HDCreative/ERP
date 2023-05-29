import 'package:hr_diag/app/core/Shared.dart';
import 'package:hr_diag/app/routers/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import '../../../base_controller.dart';

class AccountController extends BaseController {
  int currentIndex;
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  void logout() {
    confirm(
        content: "Bạn có muốn đăng xuất khỏi ứng dụng không ?",
        onConfirm: () async {
          await Shared.setUser(null);
          Get.offAllNamed(Routes.LOGIN);
        },
        onCancel: () {
          Navigator.of(Get.context).pop();
        });
  }
}
