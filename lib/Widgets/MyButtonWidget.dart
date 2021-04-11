import 'package:flutter/material.dart';

import '../Constants.dart';

class MyButtonWidget extends StatelessWidget {
  const MyButtonWidget({
    Key key,
    @required this.width,
    @required this.height,
    @required this.text,
    @required this.func,
  }) ;

  final double width;
  final double height;
  final String text;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        width: width,
        height: height*.08,
        padding: EdgeInsets.symmetric(horizontal: width*.05),
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
          children: [
            Spacer(),
            Text(
                text,
                style: textStyle2(height)
            ),
            Spacer(),
            Container(
              width: height*.05,
              height: height*.05,
              decoration: BoxDecoration(
                  color: mainColor,
                  shape: BoxShape.circle
              ),
              child: Icon(Icons.arrow_forward,color: Colors.white,size: height*.03,),
            )
          ],
        ),
      ),
    );
  }
}