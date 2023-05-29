class BillInfo {
  int shopId;
  String cusName;
  int billDate;
  String billSeri;
  String luckyDrawCode;

  BillInfo(
      {this.shopId,
        this.cusName,
        this.billDate,
        this.billSeri,
        this.luckyDrawCode});

  BillInfo.fromJson(Map<String, dynamic> json) {
    shopId = json['ShopId'];
    cusName = json['CusName'];
    billDate = json['BillDate'];
    billSeri = json['BillSeri'];
    luckyDrawCode = json['LuckyDrawCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ShopId'] = this.shopId;
    data['CusName'] = this.cusName;
    data['BillDate'] = this.billDate;
    data['BillSeri'] = this.billSeri;
    data['LuckyDrawCode'] = this.luckyDrawCode;
    return data;
  }
}

