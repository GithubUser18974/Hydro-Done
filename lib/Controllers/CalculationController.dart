import 'package:flutter/material.dart';

class CalculationsProvider with ChangeNotifier{

  String cSystemType = '' ;
  String cFlowRate = '' ;
  String cGPD = '' ;
  String cWaterHardness = '' ;
  String cTankSize = '' ;
  String cIronLevel = '' ;
  String cPHLevel = '' ;

  bool filled = false;

  void filledSetter(bool myBool){
    filled = myBool;
    notifyListeners();
  }

  void setter(String keyWord,var dropdownValue){
    if(keyWord == 'System Type'){
      cSystemType = dropdownValue;
      print('done');
    }else if(keyWord == 'GPD of Pump'){
      cGPD = dropdownValue;
      print('done');
    }else if(keyWord == 'Flow Rate in GPM'){
      cFlowRate = dropdownValue;
      print('done');
    }else if(keyWord == 'Tank Size'){
      cTankSize = dropdownValue;
      print('done');
    }else if(keyWord == 'Iron Level' ){
      cIronLevel = dropdownValue;
      print('done');
    }else if(keyWord == 'Water Hardness'){
      cWaterHardness = dropdownValue;
      print('done');
    }else if(keyWord == 'PH Level'){
      cPHLevel = dropdownValue;
      print('done');
    }else{
      print('none');
    }
    notifyListeners();
  }

  void calculate(){

  }

  void clean(){
    print('clean');
    this.cSystemType = '';
    this.cFlowRate = '';
    this.cGPD = '';
    this.cWaterHardness = '';
    this.cTankSize = '';
    this.cIronLevel = '';
    this.cPHLevel = '';
    this.filled = false;
  }

}