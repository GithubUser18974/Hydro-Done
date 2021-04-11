import 'package:flutter/material.dart';
import 'package:hydro_app/Controllers/CalculationController.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';

class DropDownWidget extends StatefulWidget {

  DropDownWidget({
    @required this.text,
    @required this.choices,
  });

  final String text;
  final List<String> choices;

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

  String dropdownValue;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * .09,
      padding: EdgeInsets.symmetric(horizontal: width * .05),
      margin: EdgeInsets.symmetric(vertical: height * .01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(width * .03),
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
          Text(widget.text, style: textStyle3(height)),
          DropdownButtonHideUnderline(
            child: Container(
              height: height * .06,
              width: width * .36,
              padding: EdgeInsets.symmetric(
                  horizontal: width * .03, vertical: height * .005),
              decoration: BoxDecoration(
                border: Border.all(color: mainColor),
                borderRadius: BorderRadius.circular(width * .1),
              ),
              child: DropdownButton<String>(
                hint: Text('--'),
                value: dropdownValue,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: mainColor,
                  size: height * .03,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    Provider.of<CalculationsProvider>(context,listen: false).setter(widget.text, dropdownValue);
                  });
                },
                items: widget.choices
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(value),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}