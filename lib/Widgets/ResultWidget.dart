import 'package:flutter/material.dart';

import '../Constants.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    @required this.width,
    @required this.height,
    @required this.name,
    @required this.result,
  });

  final double width;
  final double height;
  final String name;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height*.08,
      padding: EdgeInsets.symmetric(horizontal: width*.05),
      margin: EdgeInsets.only(bottom: height*.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(width*.03),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              name,
              style: textStyle3(height).apply(fontSizeDelta: height*.00001)
          ),
          Text(
              result,
              style: textStyleResult(height)
          ),
        ],
      ),
    );
  }
}
