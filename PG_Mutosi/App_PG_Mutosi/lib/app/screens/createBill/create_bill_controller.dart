import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mutosi/app/base/DropDowModel.dart';
import 'package:mutosi/app/base/PhotoInfo.dart';
import 'package:mutosi/app/base/ProductInfo.dart';
import 'package:mutosi/app/base/ShopInfo.dart';
import 'package:mutosi/app/base_controller.dart';
import 'package:mutosi/app/context/auditContext.dart';
import 'package:mutosi/app/core/DateTimes.dart';
import 'package:mutosi/app/core/HttpResponseMessage.dart';
import 'package:mutosi/app/core/HttpUtils.dart';
import 'package:mutosi/app/core/Urls.dart';
import 'package:mutosi/app/core/Utility.dart';
import 'package:mutosi/app/screens/kpis/surveyComponents/albumImages.dart';
import 'package:mutosi/app/extensions/ExsString.dart';

class CreateBillController extends BaseController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> giftController = TextEditingController().obs;
  Rx<TextEditingController> paymentMethodController =
      TextEditingController().obs;
  Rx<TextEditingController> billController = TextEditingController().obs;
  Rx<TextEditingController> amountController = TextEditingController().obs;
  RxInt sex = 5.obs;
  RxInt playMiniGame = 5.obs;
  RxInt playLuckyRaw = 5.obs;
  RxList<DropDownModel> products = RxList.empty(growable: true);
  Rx<DropDownModel> productChoose =
      DropDownModel(key: null, label: 'Chọn', value: null).obs;
  RxList<File> imageBill = RxList.empty(growable: true);
  RxList<File> imageCusReGift = RxList.empty(growable: true);
  ShopInfo shopInfo;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void resetForm() {
    nameController.value.text = '';
    addressController.value.text = '';
    phoneController.value.text = '';
    giftController.value.text = '';
    paymentMethodController.value.text = '';
    billController.value.text = '';
    amountController.value.text = '';
    sex.value = 5;
    playMiniGame.value = 5;
    playLuckyRaw.value = 5;
    productChoose.value = products.value.first;
    imageBill.clear();
    imageCusReGift.clear();
    imageBill.refresh();
    imageCusReGift.refresh();
  }

  Future<void> onCreateBill() async {
    try {
      bool isConnect = await Utility.isInternetConnected();
      if (isConnect != null && isConnect) {
        showLoading();
        Map<String, dynamic> body = {};
        body['FUNCTION'] = 'CREATEBILL';
        body['ShopId'] = shopInfo.shopId;
        body['CusName'] = nameController.value.text;
        body['CusSex'] = sex.value;
        body['CusAddress'] = addressController.value.text;
        body['CusMobile'] = phoneController.value.text;
        body['MiniGame'] = playMiniGame.value;
        body['MiniGameComment'] = giftController.value.text;
        body['ProductId'] = productChoose.value.key;
        body['PayMethod'] = paymentMethodController.value.text;
        body['LuckyRaw'] = playLuckyRaw.value;
        body['BillSeri'] = billController.value.text;
        if (!amountController.value.text.isNullOrWhiteSpace()) {
          body['Amount'] = double.parse(amountController.value.text);
        }
        Map<String, File> files = Map();
        if (imageBill.isNotEmpty) {
          files['ImageBill'] = imageBill.first;
        }
        if (imageCusReGift.isNotEmpty) {
          files['ImageCusReGift'] = imageCusReGift.first;
        }
        HttpResponseMessage response = await HttpUtils.uploadListFile(
            url: Urls.UPLOAD_FILE, files: files, body: body);
        dismissLoading();
        if (response.statusCode == 200) {
          confirmOK(response.content.toString(), () {
            Get.back();
            resetForm();
          });
        } else {
          alert(content: response.content.toString());
          return;
        }
      } else {
        alert(content: 'Không có kết nối Internet vui lòng thử lại !');
        return;
      }
    } catch (ex) {
      dismissLoading();
      alert(content: ex.toString());
      return;
    }
  }

  String getImageCount(List<File> data) {
    if (data.isEmpty) {
      return 'Hình ảnh';
    }
    return 'Hình ảnh(' + data.length.toString() + ')';
  }

  Future<void> onStartCamera(String key) async {
    var file = await Utility.takePicture();
    if (file != null) {
      if (key.compareTo('IMAGE_BILL') == 0) {
        imageBill.clear();
        imageBill.add(File(file.path));
        imageBill.refresh();
      } else {
        imageCusReGift.clear();
        imageCusReGift.add(File(file.path));
        imageCusReGift.refresh();
      }
    }
  }

  void onViewImage(String key) {
    List<PhotoInfo> data = List.empty(growable: true);
    PhotoInfo photo = new PhotoInfo();

    if (key.compareTo('IMAGE_BILL') == 0) {
      if (imageBill.isNotEmpty) {
        photo.photoPath = imageBill.first.path;
      } else {
        alert(content: 'Không có hình ảnh cần xem !');
        return;
      }
    } else {
      if (imageCusReGift.isNotEmpty) {
        photo.photoPath = imageCusReGift.first.path;
      } else {
        alert(content: 'Không có hình ảnh cần xem !');
        return;
      }
    }
    photo.workDate = DateTimes.today();
    data.add(photo);
    Get.to(AlbumImages(photos: data));
  }

  Future<void> init() async {
    try {
      shopInfo = Get.arguments[0];
      List<ProductInfo> data = await AuditContext.getAllProduct();
      if (data != null && data.isNotEmpty) {
        products.add(DropDownModel(key: null, label: 'Chọn', value: null));
        data.forEach((element) {
          products.add(DropDownModel(
              key: element.productId.toString(),
              label: element.productName,
              value: element));
        });
        productChoose.value = products.first;
        products.refresh();
      }
      change(null, status: RxStatus.success());
    } catch (ex) {
      change(null, status: RxStatus.success());
      alert(content: ex.toString());
      return;
    }
  }

  void onBack() {
    Get.back();
  }
}
