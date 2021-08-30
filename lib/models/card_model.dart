import 'package:fire_pay/constants/color_constant.dart';
import 'package:flutter/material.dart';


class AccountModel {
  String name;
  String type;
  String balance;
  String valid;
  String moreIcon;
  String cardBackground;
  Color bgColor;
  Color firstColor;
  Color secondColor;

  AccountModel(this.name, this.type, this.balance, this.valid, this.moreIcon,
      this.cardBackground, this.bgColor, this.firstColor, this.secondColor);
}

// List<AccountModel> cards = cardData
//     .map((item) => AccountModel(
//         item['name'].toString(),
//         item['type'].toString(),
//         item['balance'].toString(),
//         item['valid'].toString(),
//         item['moreIcon'].toString(),
//         item['cardBackground'].toString(),
//         item['bgColor'] as Color,
//         item['firstColor'] as Color,
//         item['secondColor'] as Color))
//     .toList();

var cardData = [
  {
    "name": "Ahmad Mawardi",
    "type": "assets/images/mastercard_logo.png",
    "balance": "6.352.251",
    "valid": "06/24",
    "moreIcon": 'assets/icons/more_icon_grey.svg',
    "cardBackground":'assets/svg/mastercard_bg.svg',
    "bgColor": kMasterCardColor,
    "firstColor": kGreyColor,
    "secondColor": kBlackColor
  },
  {
    "name": "Mother",
    "type": "assets/images/jenius_logo.png",
    "balance": "20.528.337",
    "valid": "02/23",
    "moreIcon": 'assets/icons/more_icon_white.svg',
    "cardBackground":'assets/svg/jenius_bg.svg',
    "bgColor": kJeniusCardColor,
    "firstColor": kWhiteColor,
    "secondColor": kWhiteColor
  },

  {
    "name": "Father",
    "type": "assets/images/mastercard_logo.png",
    "balance": "6.352.251",
    "valid": "06/24",
    "moreIcon": 'assets/icons/more_icon_grey.svg',
    "cardBackground":'assets/svg/mastercard_bg.svg',
    "bgColor": kMasterCardColor,
    "firstColor": kGreyColor,
    "secondColor": kBlackColor
  }
];
