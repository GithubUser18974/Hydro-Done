import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants.dart';

class Header extends StatelessWidget {
  const Header({
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
        height: height * .5,
        padding: EdgeInsets.symmetric(horizontal: width*.1),
        decoration: BoxDecoration(
          color: mainColor,
        ),
        child: Image(
          image: AssetImage('images/AHS_Logo_White.png'),
        )
      ),
    );
  }
}
