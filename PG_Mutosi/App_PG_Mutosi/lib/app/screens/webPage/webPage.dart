import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:mutosi/app/screens/webPage/webPage_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/base_app_bar.dart';

class WebPage extends GetWidget<WebPageController>{
  final WebPageController webPageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Webview'),
        rightIsNotify: false,
        height: 50,
        isShowBackGround: false,
        leftIcon: Icons.arrow_back_ios,
        leftClick: () {
          Get.back();
        },
      ),
      body: InAppWebView(
        initialOptions: webPageController.options,
        pullToRefreshController: webPageController.pullToRefreshController,
        onWebViewCreated: (controller){
          webPageController.webViewController = controller;
          controller.loadUrl(urlRequest:  URLRequest(url: Uri.parse(webPageController.currentURL)));
        },
        onLoadStart: (controller,url){
          EasyLoading.show();
        },
        onLoadStop: (controller, url) {
          EasyLoading.dismiss();
        },
        
        onDownloadStartRequest: (controller, url,) async {
             var urlEncode =  jsonEncode(url);
             var urlDecode =  jsonDecode(urlEncode);
             var urlString = urlDecode['url'];
            await launchUrl(Uri.parse(urlString),mode: LaunchMode.externalApplication);
            EasyLoading.dismiss();
        },
        
        initialUrlRequest: URLRequest(url: Uri.parse(webPageController.currentURL))),
    );
  }

}