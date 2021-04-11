import 'package:flutter/material.dart';
import 'package:hydro_app/Controllers/CalculationController.dart';
import 'package:hydro_app/Widgets/HeaderWidget.dart';
import 'package:hydro_app/Widgets/MyButtonWidget.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';

class RustPreventionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Header(width: width, height: height),
          SizedBox(height: height*.05,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*.01,),
                Text(
                    'System Type',
                    style: textStyle1(height)
                ),
              ],
            ),
          ),
          SizedBox(height: height*.05,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*.125),
            child: Column(
              children: [
                MyButtonWidget(width: width, height: height,text: "Injection",func: (){
                  Provider.of<CalculationsProvider>(context,listen: false).clean();
                  Navigator.pushNamed(context, '/InjectionPage');
                },),
                buttonSpacing(height),
                MyButtonWidget(width: width, height: height,text: "Siphoning",func: (){
                  Provider.of<CalculationsProvider>(context,listen: false).clean();
                  Navigator.pushNamed(context, '/SiphoningPage');
                },),
              ],
            ),
          )
        ],
      ),
    );
  }
}
