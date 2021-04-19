import 'package:flutter/material.dart';
import 'package:hydro_app/Controllers/CalculationController.dart';
import 'package:hydro_app/Widgets/DropDownWidget.dart';
import 'package:hydro_app/Widgets/HeaderWidget.dart';
import 'package:hydro_app/Widgets/MyButtonWidget.dart';
import 'package:hydro_app/Widgets/MyDisabledButtonWidget.dart';
import 'package:hydro_app/Widgets/MyFlushBar.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';

class InjectionPage extends StatefulWidget {
  @override
  _InjectionPageState createState() => _InjectionPageState();
}

class _InjectionPageState extends State<InjectionPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var myProvider = Provider.of<CalculationsProvider>(context, listen: false);
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Header(width: width, height: height * .65),
          SizedBox(
            height: height * .05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .075),
            child: Column(
              children: [
                DropDownWidget(
                  checker: () {
                    myProvider.filledSetter(myProvider.cFlowRate != '' &&
                        myProvider.cTankSize != '' &&
                        myProvider.cIronLevel != '' &&
                        myProvider.cPHLevel != '' &&
                        myProvider.cGPD != '');
                  },
                  text: 'Flow Rate in GPM',
                  choices: myGPMList,
                ),
                DropDownWidget(
                    checker: () {
                      myProvider.filledSetter(myProvider.cFlowRate != '' &&
                          myProvider.cTankSize != '' &&
                          myProvider.cIronLevel != '' &&
                          myProvider.cPHLevel != '' &&
                          myProvider.cGPD != '');
                    },
                    text: 'GPD of Pump',
                    choices: myGPDRustList),
                DropDownWidget(
                    checker: () {
                      myProvider.filledSetter(myProvider.cFlowRate != '' &&
                          myProvider.cTankSize != '' &&
                          myProvider.cIronLevel != '' &&
                          myProvider.cPHLevel != '' &&
                          myProvider.cGPD != '');
                    },
                    text: 'Tank Size',
                    choices: myTankSizeRustList),
                DropDownWidget(
                    checker: () {
                      myProvider.filledSetter(myProvider.cFlowRate != '' &&
                          myProvider.cTankSize != '' &&
                          myProvider.cIronLevel != '' &&
                          myProvider.cPHLevel != '' &&
                          myProvider.cGPD != '');
                    },
                    text: 'Iron Level',
                    choices: myIronLevelList),
                DropDownWidget(
                    checker: () {
                      myProvider.filledSetter(myProvider.cFlowRate != '' &&
                          myProvider.cTankSize != '' &&
                          myProvider.cIronLevel != '' &&
                          myProvider.cPHLevel != '' &&
                          myProvider.cGPD != '');
                    },
                    text: 'PH Level',
                    choices: myPHLevels),
                SizedBox(
                  height: height * .03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .075),
                  child: Provider.of<CalculationsProvider>(context).filled
                      ? MyButtonWidget(
                          width: width,
                          height: height,
                          text: 'Calculate',
                          func: () {
                            //  TODO
                            Provider.of<CalculationsProvider>(context,listen: false).rustCalculations();
                            Navigator.pushNamed(
                                context, '/InjectionResultPage');
                          },
                        )
                      : MyDisabledButtonWidget(
                          width: width,
                          height: height,
                          text: 'Calculate',
                          func: () {
                            MyFlushBar()
                                .show(context, 'Please Fill The Fields');
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
