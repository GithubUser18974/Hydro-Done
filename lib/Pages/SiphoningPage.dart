import 'package:flutter/material.dart';
import 'package:hydro_app/Controllers/CalculationController.dart';
import 'package:hydro_app/Pages/SiphoningResultsPage.dart';
import 'package:hydro_app/Widgets/DropDownWidget.dart';
import 'package:hydro_app/Widgets/HeaderWidget.dart';
import 'package:hydro_app/Widgets/MyButtonWidget.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';

class SiphoningPage extends StatefulWidget {
  @override
  _SiphoningPageState createState() => _SiphoningPageState();
}

class _SiphoningPageState extends State<SiphoningPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var myProvider = Provider.of<CalculationsProvider>(context,listen: false);
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Header(width: width, height: height),
          SizedBox(
            height: height * .05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .075),
            child: Column(
              children: [
                DropDownWidget(text: 'Flow Rate in GMP',choices: myGMPList,),
                DropDownWidget(text: 'Tank Size'       ,choices: myTankSizeRustList),
                DropDownWidget(text: 'Iron Level'      ,choices: myIronLevelList),
                DropDownWidget(text: 'PH Level'        ,choices: myPHLevels),
                SizedBox(
                  height: height * .03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*.075),
                  child: MyButtonWidget(width: width,height: height,text: 'Calculate',func: (){
                  //  TODO
                    if(myProvider.cFlowRate != '' && myProvider.cTankSize != '' && myProvider.cIronLevel != '' && myProvider.cPHLevel !=''){
                      Navigator.pushNamed(context,'/SiphoningResultPage');
                    }else{
                      print('Check Fields');
                    }
                  },),
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
