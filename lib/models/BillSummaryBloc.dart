import 'dart:async';

import 'package:fire_pay/helper/api_response.dart';
import 'package:fire_pay/models/AccountRepo.dart';
import 'package:fire_pay/models/BillSummaryOut.dart';
import 'package:rxdart/rxdart.dart';

class BillSummaryBloc {
  final _repository = AccountRepository();

  StreamController billSummaryController;

  StreamSink<ApiResponse<BillSummaryOutModel>> get billSummarySink =>
      billSummaryController.sink;


  BillSummaryBloc(){
    billSummaryController = StreamController<ApiResponse<BillSummaryOutModel>>.broadcast();
  }

  fetchBillSummary(List<String> accounts) async {
    final itemModel = await _repository.fetchBillSummary(accounts);
    billSummarySink.add(ApiResponse.completed(itemModel));

  }

  Future<bool> fetchBillSummary2(List<String> accounts) async {
    billSummarySink.add(ApiResponse.loading('Loading data...'));

    try {
      final itemModel = await _repository.fetchBillSummary2(accounts);
      billSummarySink.add(ApiResponse.completed(itemModel));

      return true;
    } catch (e, s) {
      //logger.e(this.runtimeType.toString(), e, s);
    }
    return false;
  }


  dispose() {
    billSummaryController.close();
  }
}

final billSummaryBloc = BillSummaryBloc();