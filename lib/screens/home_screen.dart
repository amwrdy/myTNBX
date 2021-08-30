import 'package:fire_pay/constants/color_constant.dart';
import 'package:fire_pay/models/BillSummaryBloc.dart';
import 'package:fire_pay/models/billsummary_model.dart';
//import 'package:fire_pay/main.dart';
import 'package:fire_pay/models/card_model.dart';
import 'package:fire_pay/sections/accounts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as HTTP;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BillSummaryBloc _billSummaryBloc;
  Future<dynamic> _post;

@override
  void initState() {
    print("im initializing");
    // TODO: implement initState
    super.initState();

    var ui = UsrInf();
    //var bs = BillSummary(accounts: ["2205571621s01","220266082800","210008006106"], usrInf: ui);
    _billSummaryBloc = BillSummaryBloc();
    _billSummaryBloc.fetchBillSummary(["220557162101","220266082800","210008006106"]);
    }
  getData() async* {
    await Future.delayed(Duration(seconds: 3));
    _billSummaryBloc.fetchBillSummary(["220557162101","220266082800","210008006106"]);
  }

  @override
  Widget build(BuildContext context) {
    // call class bloc

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu_rounded, color: kBlackColor),
          onPressed: (){},
          padding: EdgeInsets.only(left: 8),
        ),
      ),
      body: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              //Card Account Section
              Padding(padding: EdgeInsets.only(left:25, top: 8, bottom: 16), child: Text('Hi User!', style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w700
              ),
              ),
              ),
              Accounts(),
              Padding(padding: EdgeInsets.only(left: 24, top : 8, bottom: 16),
                  child:Text ("Last Transaction", style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w700),))
            ],
          )
      ),
    );
    return FutureBuilder(
        future: _post,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
          }
          print('error');
          return CircularProgressIndicator();
        });
  }
}

