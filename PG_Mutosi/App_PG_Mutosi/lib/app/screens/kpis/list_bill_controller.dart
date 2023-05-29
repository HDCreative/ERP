import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mutosi/app/base/ShopInfo.dart';
import 'package:mutosi/app/base_controller.dart';
import 'package:mutosi/app/models/BillInfo.dart';

import '../../core/HttpResponseMessage.dart';
import '../../core/HttpUtils.dart';
import '../../core/Urls.dart';

class ListBillController extends BaseController{
  TextEditingController cusNameController;
  TextEditingController billSeriController;
  TextEditingController fromDateController;
  TextEditingController toDateController;
  TextEditingController showFromDateController;
  TextEditingController showToDateController;
  RxList<BillInfo> lst = RxList.empty(growable: true);

  onBackPress() {
    Get.back(result: "ok");
  }

  @override
  void onInit() {
    cusNameController = TextEditingController();
    billSeriController = TextEditingController();
    fromDateController = TextEditingController();
    showFromDateController = TextEditingController();
    toDateController = TextEditingController();
    showToDateController = TextEditingController();
    super.onInit();
  }

  Future<void> fetchDataListBill(ShopInfo shop,{ String CusName = null, String BillSeri = null, String FromDate = null, String ToDate = null}) async {
    lst.clear();
    HttpResponseMessage response = new HttpResponseMessage();
    Map<String, String> params = new Map();
    params['FUNCTION'] = 'GETBILL';
    params['ShopId'] = shop.shopId.toString();
    CusName != null && CusName.isNotEmpty ? params['CusName'] = CusName : null;
    BillSeri != null && BillSeri.isNotEmpty ? params['BillSeri'] = BillSeri : null;
    FromDate != null ? params['FromDate'] = FromDate : null;
    FromDate != null ? params['ToDate'] =  ToDate : null;
    await showLoading();
    await HttpUtils.post(url: Urls.DOWNLOAD, body: params).then((value) async {
      await dismissLoading();
      response = value;
      if(response.statusCode == 200){
        try{
          var result = (response.content as Map)['Table'];
          lst.addAll((result as List).map((e) => BillInfo.fromJson(e)).toList());
        }catch(e){
          alert(content: e.toString());
        }
      }else{
        alert(content: response.content.toString());
      }
    });
  }
}