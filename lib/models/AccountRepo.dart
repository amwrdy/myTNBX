import 'dart:io';

import 'package:fire_pay/helper/api_base_helper.dart';
import 'package:fire_pay/models/BillSummaryOut.dart';
import 'package:http/http.dart' as HTTP;
import 'dart:async';
import 'dart:convert';
import 'billsummary_model.dart' ;

class AccountRepository {
  ApiBaseHelper _helper = ApiBaseHelper();


  Future<BillSummaryOutModel> fetchBillSummary(List<String> accounts) async {
    BillSummary bs = BillSummary(accounts: accounts, usrInf: UsrInf());
    final response =  await HTTP.post(
        Uri.parse('https://mytnbapp.tnb.com.my/v6/mytnbappws.asmx/GetAccountsBillSummary'),
        body: jsonEncode(bs.toJson()),
        headers: {HttpHeaders.contentTypeHeader : 'application/json'});
    if (response.statusCode == 200){
      print("printdd");
      return BillSummaryOutModel.fromJson(jsonDecode(response.body));
    }
    return jsonDecode(response.body);
  }

  Future<BillSummaryOutModel> fetchBillSummary2(List<String> accounts) async {

    BillSummary bs = BillSummary(accounts: accounts, usrInf: UsrInf());

    final response = await _helper.post("/GetAccountsBillSummary",bs.toJson());
    return BillSummaryOutModel.fromJson(response);
  }


}