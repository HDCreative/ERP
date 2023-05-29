import 'dart:convert';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:mutosi/app/core/AppStyle.dart';

import '../../core/Shared.dart';


class WebPageController extends GetxController {
  RxString title = "WebView".obs;
  String currentURL = "";
  InAppWebViewController webViewController;
  PullToRefreshController pullToRefreshController;
  InAppWebViewGroupOptions options;
  int type = 0; // 1= training , 2 tài liệu
  @override
  Future<void> onInit() async {
    super.onInit();
    try {
      currentURL = Get.arguments["url"];
      title.value = Get.arguments["pageName"] ?? "WebView";
      pullToRefreshController = PullToRefreshController(
        options: PullToRefreshOptions(
          color: AppStyle.primary,
        ),
        onRefresh: () async {
          if (Platform.isAndroid) {
            webViewController.reload();
          } else if (Platform.isIOS) {
            webViewController?.loadUrl(
                urlRequest: URLRequest(url: await webViewController?.getUrl()));
          }
        },
      );
      options = InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
            mediaPlaybackRequiresUserGesture: false,
            useOnDownloadStart: true,
          ),
          android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
          ),
          ios: IOSInAppWebViewOptions(
            allowsInlineMediaPlayback: true,
          ));
    } catch (ex) {
      print(ex.toString());
    }
  }

  @override
  void onReady() async {
    await initDataWebPage();
    await initWebPage();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    EasyLoading.dismiss();
  }

  Future<void> initDataWebPage() async {
    if (type == null || (type != null && type == 0)) {
      //var token = await Shared. String("access_token");
      currentURL += '';
    }
  }

  Future<void> initWebPage() async {
    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

      var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
          AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
      var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
          AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

      if (swAvailable && swInterceptAvailable) {
        AndroidServiceWorkerController serviceWorkerController =
            AndroidServiceWorkerController.instance();

        await serviceWorkerController
            .setServiceWorkerClient(AndroidServiceWorkerClient(
          shouldInterceptRequest: (request) async {
            print(request);
            return null;
          },
        ));
      }
    }
  }
}
