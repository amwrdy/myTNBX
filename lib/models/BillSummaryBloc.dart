import 'dart:async';

import 'package:fire_pay/models/AccountRepo.dart';
import 'package:fire_pay/models/BillSummaryOut.dart';
import 'package:rxdart/rxdart.dart';

class BillSummaryBloc {
  final _repository = AccountRepository();
  final billSummaryController = StreamController<BillSummaryOutModel>();

  StreamSink<BillSummaryOutModel> get billSummarySink =>
      billSummaryController.sink;

  fetchBillSummary(List<String> accounts) async {
    final itemModel = await _repository.fetchBillSummary(accounts);
    billSummarySink.add(itemModel);

  }

  dispose() {
    billSummaryController.close();
  }
}

final billSummaryBloc = BillSummaryBloc();