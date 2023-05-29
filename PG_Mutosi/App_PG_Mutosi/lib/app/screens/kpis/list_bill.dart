import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:mutosi/app/core/DateTimes.dart';
import 'package:mutosi/app/screens/kpis/list_bill_controller.dart';
import '../../base/MasterInfo.dart';
import '../../base/ShopInfo.dart';
import '../../components/base_app_bar.dart';
import '../../core/AppStyle.dart';
import '../../core/Utility.dart';
import '../../models/WorkResultInfo.dart';

class ListBill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListBillState();
  }
}

class ListBillState extends State<ListBill> {
  ListBillController controller;
  ShopInfo shop;
  WorkResultInfo work;
  MasterInfo kpi;

  @override
  void initState() {
    controller = Get.find();
    shop = Get.arguments[0];
    work = Get.arguments[1];
    kpi = Get.arguments[2];
    controller.fetchDataListBill(shop);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Get.mediaQuery.size;
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: BaseAppBar(
            title: Text(kpi.name),
            rightIsNotify: false,
            isShowBackGround: false,
            flexibleSpace: Container(
              height: size.height / 5 + 100,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[AppStyle.primary, AppStyle.primaryDart],
                  ),
                ),
              ),
            ),
            height: 50,
            leftIcon: Icons.arrow_back_ios_new,
            leftClick: controller.onBackPress,
            rightIcon: Icon(Icons.mic_none_rounded),
            rightClick: () => controller.onRecord(shop),
          ),
          body: body(),
        ));
  }

  Widget body() {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          SizedBox(height: 40,child:Row(children: [
            Expanded(
                child: TextFormField(
                  style: TextStyle(color: AppStyle.text_base_Color),
                  controller: controller.cusNameController,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding: EdgeInsets.all(5),
                      hintText: 'Tìm tên khách hàng'),
                )),
            SizedBox(width: 40,child: InkWell(
              child: Icon(Icons.clear,color: Colors.blueAccent,),
              onTap: (){
                controller.cusNameController.clear();
              },
            ),)
          ],)),
          SizedBox(
            height: 5,
          ),
          SizedBox(height: 40,child:Row(children: [
            Expanded(
                child: TextFormField(
                  style: TextStyle(color: AppStyle.text_base_Color),
                  controller: controller.billSeriController,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding: EdgeInsets.all(5),
                      hintText: 'Tìm mã hoá đơn'),
                )),
            SizedBox(width: 40,child: InkWell(
              child: Icon(Icons.clear,color: Colors.blueAccent,),
              onTap: (){
                controller.billSeriController.clear();
              },
            ),)
          ],)),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(child: TextFormField(
                    style: TextStyle(color: AppStyle.text_base_Color),
                    controller: controller.showFromDateController,
                    enabled: false,
                    decoration: new InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        contentPadding: EdgeInsets.all(5),
                        hintText: 'từ ngày'),
                  ),onTap: () {
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2022, 1, 1),
                      maxTime: DateTime(2024, 12, 31),
                      onConfirm: (date) {
                        String fromDate = date.year.toString()+date.month.toString()+ (date.day < 10 ? '0'+date.day.toString() : date.day.toString());
                        controller.fromDateController.text = fromDate;
                        String showFormDate = DateFormat('dd/MM/yyyy').format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(date.toString())).toString();
                        controller.showFromDateController.text = showFormDate;
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.en);
                })),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    flex: 1,
                    child: InkWell(child: TextFormField(
                      style: TextStyle(color: AppStyle.text_base_Color),
                      controller: controller.showToDateController,
                      enabled: false,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          contentPadding: EdgeInsets.all(5),
                          hintText: 'đến ngày'),
                    ),onTap: () {
                      DatePicker.showDatePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 210.0,
                          ),
                          showTitleActions: true,
                          minTime: DateTime(2022, 1, 1),
                          maxTime: DateTime(2024, 12, 31),
                          onConfirm: (date) {
                            String toDate = date.year.toString()+date.month.toString()+ (date.day < 10 ? '0'+date.day.toString() : date.day.toString());
                            controller.toDateController.text = toDate;
                            String showToDate = DateFormat('dd/MM/yyyy').format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(date.toString())).toString();
                            controller.showToDateController.text = showToDate;
                          },
                          currentTime: DateTime.now(),
                          locale: LocaleType.en);
                    })),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: SizedBox(
                      height: 40,
                      child: Icon(
                        Icons.search_outlined,
                        color: Colors.blueAccent,
                        size: 30,
                      )),
                  onTap: () async {
                    await controller.fetchDataListBill(shop,
                        CusName: controller.cusNameController.text,
                        BillSeri: controller.billSeriController.text,
                        FromDate: controller.fromDateController.text,
                        ToDate: controller.toDateController.text);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          listData(),
        ],
      ),
    );
  }

  Widget listData() {
    return Expanded(
        flex: 1,
        child: Obx(
          () => controller.lst.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.lst.length,
                  itemBuilder: (buildContext, index) {
                    return Container(
                      constraints: BoxConstraints(minHeight: 40),
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(
                        children: [
                          Row(children: [
                            SizedBox(width: 110,child: Text('Tên khách hàng:'),),
                            SizedBox(width: 5,),
                            Expanded(flex: 1, child: Text(controller.lst[index].cusName),)
                          ],),
                          SizedBox(height: 5,),
                          Row(children: [
                            SizedBox(width: 80,child: Text('Mã hoá đơn:'),),
                            SizedBox(width: 5,),
                            Expanded( child: Text(controller.lst[index].billSeri != null ? controller.lst[index].billSeri : ""),),
                            SizedBox(width: 80,child: Text('Mã quay số:'),),
                            SizedBox(width: 5,),
                            Expanded( child: Text(controller.lst[index].luckyDrawCode != null ? controller.lst[index].luckyDrawCode : "Không tham gia",softWrap: true,),)
                          ],),
                          SizedBox(height: 5,),
                          Row(children: [
                            SizedBox(width: 120,child: Text('Ngày mua hàng:'),),
                            SizedBox(width: 5,),
                            Expanded( child: Text( DateTimes.dateIntToString(date: controller.lst[index].billDate,type:1)),),
                          ],)
                        ],
                      ),
                    );
                  },
                )
              : Center(),
        ));
  }
}
