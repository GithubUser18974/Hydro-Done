import 'package:flutter/material.dart';
import 'package:hydro_app/Controllers/CalculationController.dart';
import 'package:hydro_app/Widgets/MyButtonWidget.dart';
import 'package:hydro_app/Widgets/ResultWidget.dart';
import 'package:hydro_app/Widgets/ResultsHeader.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';

class InjectionResultPage extends StatelessWidget {
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
                ResultWidget(width: width, height: height,name: 'System Type',result: 'Injection',),
                ResultWidget(width: width, height: height,name: 'GPD of Pump',result: '${myProvider.cGPD} GPD',),
                ResultWidget(width: width, height: height,name: 'Flow rate',result: '${myProvider.cFlowRate} GPM',),
                ResultWidget(width: width, height: height,name: 'Tank Size',result: '${myProvider.cTankSize}',),
                ResultWidget(width: width, height: height,name: 'Iron Level',result: '${myProvider.cIronLevel}',),
                ResultWidget(width: width, height: height,name: 'PH Level',result: '${myProvider.cPHLevel}',),
                //TODO Calculations
                ResultWidget(width: width, height: height,name: 'Amt. of Formula',result: '${myProvider.amt.toStringAsFixed(2)} Units',),
                ResultWidget(width: width, height: height,name: 'Runtime',result: '${myProvider.totalRunTime.toStringAsFixed(1)} Hours',),
              ],
            ),
          ),
          SizedBox(
            height: height * .01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myProvider.cPHLevel == '< 6' ? "With a pH of Under 6, you should be using\nRid O' Rust Stain Extreme Water Concentrate" : "With a pH of Over 6, you should be using Rid O' Rust Concentrated Rust Preventer 2X",
                  style: textStyle4(height*.8),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "*Units are ½ gallon increments of Rid O' Rust",
                    style: textStyle4(height*.8).apply(color: mainColor),
                  ),
                ),
              ],
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


