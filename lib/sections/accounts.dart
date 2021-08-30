import 'package:fire_pay/models/BillSummaryBloc.dart';
import 'package:fire_pay/models/BillSummaryOut.dart';
import 'package:fire_pay/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Accounts extends StatelessWidget {
  const Accounts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      child: StreamBuilder<BillSummaryOutModel>(
        stream: billSummaryBloc.billSummaryController.stream,
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var billSummary = snapshot.data.d.data;
          return ListView.builder (
              padding: EdgeInsets.only(left: 16, right: 8),
              scrollDirection: Axis.horizontal,
              itemCount: billSummary.length ,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(right: 8),
                    height: 175,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.lightBlue,
                        boxShadow: [BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 1,
                            spreadRadius: 4,
                            offset: Offset(0.0, 8.0)
                        )]
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left:16,
                          top:12,
                          width:33,
                          child: Image.asset('assets/images/mastercard_logo.png', width:33, height: 22,
                          ),),
                        Positioned(
                            right:12, top:12, child: SvgPicture.asset('assets/svg/mastercard_bg.svg')),
                        Positioned(top:14,
                            right: 12,
                            child: Text('My House', style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white54),)),
                        Positioned(
                            top:63,
                            left:16,
                            child: Text("Your Outstanding Amount",
                                style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white54))),
                        Positioned(
                            top:81,
                            left:16,
                            child: Text("RM " + billSummary[index].amountDue.toString(),
                                style: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white54))),
                        Positioned(
                            bottom: 30,
                            left:16,
                            child: Text("Pay before ",
                                style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white54))),
                        Positioned(
                            bottom: 12,
                            left:16,
                            child: Text(billSummary[index].billDueDate,
                                style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white54))),
                        Positioned(
                            bottom: 8,
                            right : 8,
                            child: SvgPicture.asset('assets/svg/mastercard_bg.svg', height: 24, width: 24,))
                      ],
                    )
                );
              });
        })
    );
  }
}
