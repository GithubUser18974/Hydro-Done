import 'package:flutter/material.dart';
import 'package:hydro_app/Controllers/CalculationController.dart';
import 'package:hydro_app/Widgets/MyButtonWidget.dart';
import 'package:hydro_app/Widgets/ResultWidget.dart';
import 'package:hydro_app/Widgets/ResultsHeader.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';

class CalciumResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var myProvider = Provider.of<CalculationsProvider>(context,listen: false);
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ResultsHeader(width: width, height: height),
          SizedBox(
            height: height * .05,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*.125),
            child: Column(
              children: [
                ResultWidget(width: width, height: height,name: 'System Type'       ,result: 'Calcium',),
                ResultWidget(width: width, height: height,name: 'GPD of Pump'       ,result: '${myProvider.cGPD}',),
                ResultWidget(width: width, height: height,name: 'Flow rate'         ,result: '${myProvider.cFlowRate} GMP',),
                ResultWidget(width: width, height: height,name: 'Tank Size'         ,result: '${myProvider.cTankSize}',),
                //TODO Calculations
                ResultWidget(width: width, height: height,name: 'Runtime'           ,result: '435 Hours',),
                ResultWidget(width: width, height: height,name: 'Amt. of Formula'   ,result: '4.80 Units',),
              ],
            ),
          ),
          SizedBox(
            height: height * .01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*.05),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "*Units are ½ gallon increments of Rid O' Rust",
                style: textStyle4(height*.8).apply(color: mainColor),
              ),
            ),
          ),
          SizedBox(
            height: height * .03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*.2),
            child: MyButtonWidget(width: width,height: height,text: 'Go Home',func: (){
              Navigator.pop(context);
              Navigator.pop(context);
            },
            ),
          ),
          SizedBox(
            height: height * .05,
          ),
        ],
      ),
    );
  }
}