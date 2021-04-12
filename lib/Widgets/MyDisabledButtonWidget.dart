import 'package:flutter/material.dart';

import '../Constants.dart';

class MyDisabledButtonWidget extends StatelessWidget {
  const MyDisabledButtonWidget({
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
          color: Colors.grey,
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
                style: textStyle2(height).apply(color: Colors.white54)
            ),
            Spacer(),
            Container(
              width: height*.05,
              height: height*.05,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  shape: BoxShape.circle
              ),
              child: Icon(Icons.arrow_forward,color: Colors.white54,size: height*.03,),
            )
          ],
        ),
      ),
    );
  }
}