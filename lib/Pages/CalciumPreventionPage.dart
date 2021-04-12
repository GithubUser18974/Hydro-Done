import 'package:flutter/material.dart';
import 'package:hydro_app/Controllers/CalculationController.dart';
import 'package:hydro_app/Widgets/DropDownWidget.dart';
import 'package:hydro_app/Widgets/HeaderWidget.dart';
import 'package:hydro_app/Widgets/MyButtonWidget.dart';
import 'package:hydro_app/Widgets/MyDisabledButtonWidget.dart';
import 'package:hydro_app/Widgets/MyFlushBar.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';

class CalciumPreventionPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var myProvider = Provider.of<CalculationsProvider>(context,listen: false);
    myProvider.filledSetter(myProvider.cFlowRate != '' && myProvider.cTankSize != '' && myProvider.cGPD != '' && myProvider.cWaterHardness != '');
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Header(width: width, height: height*.65),
          SizedBox(
            height: height * .05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .075),
            child: Column(
              children: [
                DropDownWidget(text: 'Flow Rate in GMP',choices: myGMPList,),
                DropDownWidget(text: 'GPD of Pump'     ,choices: myGPDCalciumList),
                DropDownWidget(text: 'Water Hardness'  ,choices: myWaterHardnessList),
                DropDownWidget(text: 'Tank Size'       ,choices: myTankSizeCalciumList),
                SizedBox(
                  height: height * .03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*.075),
                  child: Provider.of<CalculationsProvider>(context).filled ? MyButtonWidget(width: width,height: height,text: 'Calculate',func: (){
                    //  TODO
                    Navigator.pushNamed(context,'/CalciumResultPage');
                  },
                  ) :
                  MyDisabledButtonWidget(width: width,height: height,text: 'Calculate',func: (){
                    MyFlushBar().show(context, 'Please Fill The Fields');
                  },
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
