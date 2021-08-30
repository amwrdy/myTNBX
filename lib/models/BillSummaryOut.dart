class BillSummaryOutModel {
  D d;

  BillSummaryOutModel({this.d});

  BillSummaryOutModel.fromJson(Map<String, dynamic> json) {
    d = json['d'] != null ? new D.fromJson(json['d']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.d != null) {
      data['d'] = this.d.toJson();
    }
    return data;
  }
}

class D {
  String sType;
  List<Data> data;
  Null mandatoryChargesTitle;
  Null mandatoryChargesMessage;
  Null mandatoryChargesPriButtonText;
  Null mandatoryChargesSecButtonText;
  String status;
  String isError;
  String message;
  String errorCode;
  String errorMessage;
  String displayMessage;
  String displayType;
  String displayTitle;
  String refreshTitle;
  String refreshMessage;
  String refreshBtnText;
  bool isPayEnabled;

  D(
      {this.sType,
        this.data,
        this.mandatoryChargesTitle,
        this.mandatoryChargesMessage,
        this.mandatoryChargesPriButtonText,
        this.mandatoryChargesSecButtonText,
        this.status,
        this.isError,
        this.message,
        this.errorCode,
        this.errorMessage,
        this.displayMessage,
        this.displayType,
        this.displayTitle,
        this.refreshTitle,
        this.refreshMessage,
        this.refreshBtnText,
        this.isPayEnabled});

  D.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    mandatoryChargesTitle = json['MandatoryChargesTitle'];
    mandatoryChargesMessage = json['MandatoryChargesMessage'];
    mandatoryChargesPriButtonText = json['MandatoryChargesPriButtonText'];
    mandatoryChargesSecButtonText = json['MandatoryChargesSecButtonText'];
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    errorCode = json['ErrorCode'];
    errorMessage = json['ErrorMessage'];
    displayMessage = json['DisplayMessage'];
    displayType = json['DisplayType'];
    displayTitle = json['DisplayTitle'];
    refreshTitle = json['RefreshTitle'];
    refreshMessage = json['RefreshMessage'];
    refreshBtnText = json['RefreshBtnText'];
    isPayEnabled = json['IsPayEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__type'] = this.sType;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['MandatoryChargesTitle'] = this.mandatoryChargesTitle;
    data['MandatoryChargesMessage'] = this.mandatoryChargesMessage;
    data['MandatoryChargesPriButtonText'] = this.mandatoryChargesPriButtonText;
    data['MandatoryChargesSecButtonText'] = this.mandatoryChargesSecButtonText;
    data['status'] = this.status;
    data['isError'] = this.isError;
    data['message'] = this.message;
    data['ErrorCode'] = this.errorCode;
    data['ErrorMessage'] = this.errorMessage;
    data['DisplayMessage'] = this.displayMessage;
    data['DisplayType'] = this.displayType;
    data['DisplayTitle'] = this.displayTitle;
    data['RefreshTitle'] = this.refreshTitle;
    data['RefreshMessage'] = this.refreshMessage;
    data['RefreshBtnText'] = this.refreshBtnText;
    data['IsPayEnabled'] = this.isPayEnabled;
    return data;
  }
}

class Data {
  double amountDue;
  String billDueDate;
  String accNum;
  String incrementREDueDateByDays;
  bool isError;
  bool showEppToolTip;

  Data(
      {this.amountDue,
        this.billDueDate,
        this.accNum,
        this.incrementREDueDateByDays,
        this.isError,
        this.showEppToolTip});

  Data.fromJson(Map<String, dynamic> json) {
    amountDue = json['amountDue'];
    billDueDate = json['billDueDate'];
    accNum = json['accNum'];
    incrementREDueDateByDays = json['IncrementREDueDateByDays'];
    isError = json['IsError'];
    showEppToolTip = json['ShowEppToolTip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amountDue'] = this.amountDue;
    data['billDueDate'] = this.billDueDate;
    data['accNum'] = this.accNum;
    data['IncrementREDueDateByDays'] = this.incrementREDueDateByDays;
    data['IsError'] = this.isError;
    data['ShowEppToolTip'] = this.showEppToolTip;
    return data;
  }
}
