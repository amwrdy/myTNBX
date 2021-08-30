

class BillSummary {
   List<String> accounts;
   UsrInf usrInf;

  BillSummary({this.accounts, this.usrInf});

  BillSummary.fromJson(Map<String, dynamic> json) {
    accounts = json['accounts'].cast<String>();
    usrInf =
    json['usrInf'] != null ? new UsrInf.fromJson(json['usrInf']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accounts'] = this.accounts;
    if (this.usrInf != null) {
      data['usrInf'] = this.usrInf.toJson();
    }
    return data;
  }
}

class UsrInf {
  String lang;
  String secAuthK1;

  UsrInf({this.lang, this.secAuthK1});

  UsrInf.fromJson(Map<String, dynamic> json) {
    lang = json['lang'];
    secAuthK1 = json['sec_auth_k1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lang'] = "EN";
    data['sec_auth_k1'] = "E6148656-205B-494C-BC95-CC241423E72F";
    return data;
  }
}
