import 'package:flushbar/flushbar.dart';
import 'package:hydro_app/Constants.dart';

class MyFlushBar{
  show(context,text){
    Flushbar(
      title: "Warning",
      message: text,
      backgroundColor: mainColor,
      duration: Duration(seconds: 2),
    ).show(context);
  }
}
