import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../Constants.dart';

class ResultsHeader extends StatelessWidget {
  const ResultsHeader({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: width,
        height: height * .4,
        decoration: BoxDecoration(
          color: mainColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height*.1,),
            Expanded(
              flex: 7,
              child: Image(
                image: AssetImage('images/AHS_Logo_White.png'),
              )
            ),
            SizedBox(height: height*.02,),
            Expanded(
              flex: 4,
              child: Text(
                'Dosage Calculations Results',
                style: TextStyle(
                    fontSize: width*.06,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
