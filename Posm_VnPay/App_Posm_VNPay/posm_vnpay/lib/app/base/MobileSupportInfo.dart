import 'package:posm_vnpay/app/base/BaseInfo.dart';

class MobileSupportInfo extends BaseInfo {
  int employeeId;
  String queryString;
  MobileSupportInfo.fromJson(dynamic json) {
    employeeId = json["EmployeeId"];
    queryString = json["QueryString"];
  }
}