import 'package:get/get.dart';
import 'package:mutosi/app/base/TabInfo.dart';
import 'package:mutosi/app/core/Utility.dart';
import 'package:mutosi/app/routers/app_routes.dart';

import '../../../base_controller.dart';

class HomeController extends BaseController {
  int currentIndex;
  String version = "0";
  List<TabInfo> tabs = new List.empty(growable: true);
  @override
  void onInit() async {
    super.onInit();
    version= await  Utility.getVersion();
    print("version-" + version);
    init();

  }

  void init() {
    tabs.add(new TabInfo(
        id: 0,
        title: 'Cửa hàng',
        icon: 'assets/icons/ic_shop.png',
        isSelected: false,
        page: null));
    tabs.add(new TabInfo(
        id: 1,
        title: 'Lucky draw',
        icon: 'assets/icons/ic_support.png',
        isSelected: false,
        page: null));
    tabs.add(new TabInfo(
        id: 2,
        title: 'Công cụ',
        icon: 'assets/icons/ic_support.png',
        isSelected: false,
        page: null));
    // tabs.add(new TabInfo(
    //     id: 2,
    //     title: 'Tài liệu chấm điểm',
    //     icon: 'assets/icons/ic_support.png',
    //     isSelected: false,
    //     page: null));
    // tabs.add(new TabInfo(
    //     id: 3,
    //     title: 'Tài liệu sử dụng App',
    //     icon: 'assets/icons/ic_support.png',
    //     isSelected: false,
    //     page: null));
    change(null, status: RxStatus.success());
  }

  void onMenuTap(TabInfo tabInfo) {
    switch (tabInfo.id) {
      case 0:
        Get.toNamed(Routes.SHOP_PANEL, preventDuplicates: false);
        break;
      case 1:
       Get.toNamed(Routes.WEBPAGE, preventDuplicates: false,arguments: {
         "url" : "www.google.com",
         "WebView" : "lucky draw"
       });
        break;
      case 2:
        Get.toNamed(Routes.TOOL, preventDuplicates: false);
        break;
    }
  }
}
