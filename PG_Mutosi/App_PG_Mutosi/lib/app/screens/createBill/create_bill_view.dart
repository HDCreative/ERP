import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mutosi/app/base/DropDowModel.dart';
import 'package:mutosi/app/base/ProductInfo.dart';
import 'package:mutosi/app/components/base_app_bar.dart';
import 'package:mutosi/app/components/base_gradient_button.dart';
import 'package:mutosi/app/core/AppStyle.dart';
import 'package:mutosi/app/screens/createBill/create_bill_controller.dart';

class CreateBillView extends GetView<CreateBillController> {
  @override
  Widget build(BuildContext context) {
    Size size = Get.mediaQuery.size;
    return controller.obx((state) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: WillPopScope(
            onWillPop: () async {
              controller.onBack();
              return false;
            },
            child: Scaffold(
              appBar: BaseAppBar(
                title: Text("Tạo hoá đơn"),
                rightIsNotify: false,
                height: 50,
                isShowBackGround: false,
                leftIcon: Icons.arrow_back_ios,
                leftClick: () {
                  controller.onBack();
                },
              ),
              body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: size.width,
                  height: size.height,
                  child: Column(
                    children: [
                      Expanded(
                          child: Scrollbar(
                        thickness: 2,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              itemIcon(
                                  'assets/icons/ic_user_info.svg',
                                  Obx(() => input(
                                      controller.nameController.value,
                                      'Tên khách hàng',
                                      textInputType: TextInputType.name))),
                              Obx(() => itemText('Giới tính: ',
                                  checkBox(controller.sex.value, 1))),
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 10),
                                child: Obx(() => TextFormField(
                                      textAlign: TextAlign.start,
                                      maxLines: 5,
                                      style: TextStyle(
                                          color: AppStyle.text_base_Color),
                                      controller:
                                          controller.addressController.value,
                                      decoration: new InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          contentPadding: EdgeInsets.all(5),
                                          hintText: 'Địa chỉ khách hàng...'),
                                    )),
                              ),
                              itemIcon(
                                  'assets/icons/ic_phone.svg',
                                  Obx(() => input(
                                      controller.phoneController.value,
                                      'Số điện thoại',
                                      textInputType: TextInputType.phone))),
                              itemIcon(
                                  'assets/icons/ic_bill.svg',
                                  Obx(() => input(
                                      controller.billController.value,
                                      'Mã đơn hàng',
                                      textInputType: TextInputType.phone))),
                              itemIcon(
                                  'assets/icons/ic_money.svg',
                                  Obx(() => input(
                                      controller.amountController.value,
                                      'Tổng tiền',
                                      textInputType: TextInputType.number))),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Khách hàng có chơi Mini game không ? ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue)),
                                    Obx(() => checkBox(
                                        controller.playMiniGame.value, 2,
                                        yesTitle: 'Có', noTitle: 'Không'))
                                  ],
                                ),
                              ),
                              Obx(() => Visibility(
                                    visible:
                                        (controller.playMiniGame.value != 5 &&
                                            controller.playMiniGame.value == 1),
                                    child: itemIcon(
                                        'assets/icons/ic_gift.svg',
                                        Obx(() => input(
                                            controller.giftController.value,
                                            'Nhập tên quà tặng'))),
                                  )),
                              itemIcon(
                                  'assets/icons/ic_payment_method.svg',
                                  Obx(() => input(
                                        controller
                                            .paymentMethodController.value,
                                        'Phương thức thanh toán',
                                      ))),
                              Container(
                                width: size.width,
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Chọn sản phẩm: ',
                                        style: TextStyle(fontSize: 17),
                                        textAlign: TextAlign.center,
                                      ),
                                      Expanded(
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 5, bottom: 10),
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFFD9D9D9))),
                                              child: Obx(() =>
                                                  DropdownButton<DropDownModel>(
                                                    value: controller
                                                        .productChoose.value,
                                                    items: controller
                                                        .products.value
                                                        .map((DropDownModel
                                                            value) {
                                                      return DropdownMenuItem<
                                                          DropDownModel>(
                                                        value: value,
                                                        child:
                                                            Text(value.label),
                                                      );
                                                    }).toList(),
                                                    isDense: true,
                                                    isExpanded: true,
                                                    underline: SizedBox(),
                                                    hint: Text(""),
                                                    onChanged: (DropDownModel
                                                        select) async {
                                                      controller.productChoose
                                                          .value = select;
                                                    },
                                                  ))))
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Khách hàng có quay Lucky Draw hay không?',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                    Obx(() => checkBox(
                                        controller.playLuckyRaw.value, 3,
                                        yesTitle: 'Có', noTitle: 'Không'))
                                  ],
                                ),
                              ),
                              Obx(() => itemCamera(
                                      'Chụp ảnh bill mua hàng',
                                      'IMAGE_BILL',
                                      controller.imageBill,
                                      size, onStartCamera: (key) {
                                    controller.onStartCamera(key);
                                  }, onViewImage: (key) {
                                    controller.onViewImage(key);
                                  })),
                              SizedBox(
                                height: 10,
                              ),
                              Obx(() => itemCamera(
                                      'Chụp ảnh khách hàng nhận quà',
                                      'IMAGE_GES',
                                      controller.imageCusReGift,
                                      size, onStartCamera: (key) {
                                    controller.onStartCamera(key);
                                  }, onViewImage: (key) {
                                    controller.onViewImage(key);
                                  }))
                            ],
                          ),
                        ),
                      )),
                      Container(
                        height: 40,
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 20),
                        child: BaseGradientButton(
                          onPressed: () {
                            controller.onCreateBill();
                          },
                          text: 'Tạo',
                        ),
                      )
                    ],
                  )),
            ))));
  }

  Widget itemCamera(String title, String key, List<File> data, Size size,
      {Function(String) onStartCamera, Function(String) onViewImage}) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    flex: 1,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(2)),
                          shape: BoxShape.rectangle,
                          color: Colors.blue[200],
                        ),
                        padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                        height: 35,
                        child: Row(
                          children: [
                            Icon(
                              Icons.camera,
                              color: const Color(0xFF9E9E9E),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Chụp hình')
                          ],
                        ),
                      ),
                      onTap: () {
                        onStartCamera(key);
                      },
                    )),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    flex: 1,
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(2)),
                          shape: BoxShape.rectangle,
                          color: Colors.blue[200],
                        ),
                        child: InkWell(
                          child: Row(
                            children: [
                              Icon(
                                Icons.image,
                                color: const Color(0xFF9E9E9E),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(controller.getImageCount(data))
                            ],
                          ),
                          onTap: () {
                            onViewImage(key);
                          },
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget input(TextEditingController controller, String hint,
      {TextInputType textInputType = TextInputType.text}) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        keyboardType: textInputType,
        style: TextStyle(color: AppStyle.text_base_Color),
        controller: controller,
        decoration: new InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            contentPadding: EdgeInsets.all(5),
            hintText: hint),
      ),
    );
  }

  Widget checkBox(int value, int type,
      {String yesTitle = 'Nam', String noTitle = 'Nữ'}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Theme(
                data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                child: CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text(
                      yesTitle,
                      style: TextStyle(fontSize: 17),
                    ),
                    value: (value != 5 && value == 1) ? true : false,
                    onChanged: (bool check) {
                      if (type == 1) {
                        if (check) {
                          controller.sex.value = 1;
                        } else {
                          controller.sex.value = 5;
                        }
                      } else if (type == 2) {
                        if (check) {
                          controller.playMiniGame.value = 1;
                        } else {
                          controller.playMiniGame.value = 5;
                        }
                      } else {
                        if (check) {
                          controller.playLuckyRaw.value = 1;
                        } else {
                          controller.playLuckyRaw.value = 5;
                        }
                      }
                    },
                    controlAffinity: ListTileControlAffinity.leading))),
        Expanded(
            child: Theme(
                data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                child: CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text(noTitle, style: TextStyle(fontSize: 17)),
                    value: (value != 5 && value == 0) ? true : false,
                    /**/
                    onChanged: (bool check) {
                      if (type == 1) {
                        if (check) {
                          controller.sex.value = 0;
                        } else {
                          controller.sex.value = 5;
                        }
                      } else if (type == 2) {
                        if (check) {
                          controller.playMiniGame.value = 0;
                        } else {
                          controller.playMiniGame.value = 5;
                        }
                      } else {
                        if (check) {
                          controller.playLuckyRaw.value = 0;
                        } else {
                          controller.playLuckyRaw.value = 5;
                        }
                      }
                    },
                    controlAffinity: ListTileControlAffinity.leading)))
      ],
    );
  }

  Widget itemText(String title, Widget widget) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 17),
                  ),
                )),
            Expanded(flex: 5, child: widget)
          ],
        ),
      ),
    );
  }

  Widget itemIcon(String icon, Widget widget) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                icon,
                width: 25,
                height: 25,
                color: Colors.black,
              ),
            ),
            Expanded(child: widget)
          ],
        ),
      ),
    );
  }
}
