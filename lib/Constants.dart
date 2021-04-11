import 'package:flutter/material.dart';

Color mainColor = Color(0xff0D6937);

TextStyle textStyle1(height){
  return TextStyle(
      fontSize: height*.045,
      fontWeight: FontWeight.w700,
      color: Colors.black,
  );
}

TextStyle textStyle2(height){
  return TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: height*.028
  );
}

TextStyle textStyle3(height){
  return TextStyle(
    fontSize: height*.022,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}

TextStyle textStyle4(height){
  return TextStyle(
    fontSize: height*.025,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );
}

TextStyle textStyleResult(height){
  return TextStyle(
      color: mainColor,
      fontWeight: FontWeight.w300,
      fontSize: height*.022
  );
}

Widget buttonSpacing(height){
  return SizedBox(height: height*.03,);
}

List<String> myGMPList = ['15', '25', '35', '45', '55', '65', '75', '85', '95', '100' ];

List<String> myGPDRustList = ['10 GPD','11 GPD','12 GPD','14 GPD','16 GPD','17 GPD','22 GPD','24 GPD','30 GPD','40 GPD'];

List<String> myGPDCalciumList = ['10 GPD','11 GPD','16 GPD','17 GPD','22 GPD','24 GPD'];

List<String> myTankSizeRustList = ['15', '30', '100'];

List<String> myTankSizeCalciumList = ['30', '100'];

List<String> myIronLevelList = ['1', '2', '3', '4', '5', '6', '7', '8', '8+'];

List<String> myPHLevels = ['less than 6' , '6 or above'];

List<String> myWaterHardnessList = ['5', '10', '15', '20', '25', '30', '35', '40'];

