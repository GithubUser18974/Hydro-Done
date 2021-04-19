import 'package:flutter/material.dart';
import 'package:hydro_app/Constants.dart';
import 'package:hydro_app/Controllers/CalculationController.dart';
import 'package:hydro_app/Widgets/HeaderWidget.dart';
import 'package:hydro_app/Widgets/MyButtonWidget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if(DateTime.now().month == 4){
      return DateTime.now().day >= 19 && DateTime.now().day <= 29 ? Scaffold(
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
                  Text(
                      'Hello, nice to meet you!',
                      style: textStyle4(height)
                  ),
                  SizedBox(height: height*.01,),
                  Text(
                      'Calculation Type',
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
                  MyButtonWidget(width: width, height: height,text: "Rust Prevention",func: (){
                    Navigator.pushNamed(context, '/RustPreventionPage');
                  },),
                  buttonSpacing(height),
                  MyButtonWidget(width: width, height: height,text: "Calcium Prevention",func: (){
                    Provider.of<CalculationsProvider>(context,listen: false).clean();
                    Provider.of<CalculationsProvider>(context,listen: false).setter('System Type', 'Calcium');
                    Navigator.pushNamed(context, '/CalciumPreventionPage');
                  },),

                ],
              ),
            )
          ],
        ),
      ) : Container();
    }else{
      return Container();
    }
  }
}