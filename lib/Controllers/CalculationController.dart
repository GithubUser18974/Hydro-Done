import 'package:flutter/material.dart';

class CalculationsProvider with ChangeNotifier{

  String cSystemType = '' ;
  String cFlowRate = '' ;
  String cGPD = '' ;
  String cWaterHardness = '' ;
  String cTankSize = '' ;
  String cIronLevel = '' ;
  String cPHLevel = '' ;


  double amt;
  double totalRunTime;

  bool filled = false;

  void filledSetter(bool myBool){
    filled = myBool;
    notifyListeners();
  }

  void setter(String keyWord,var dropdownValue){
    if(keyWord == 'System Type'){
      cSystemType = dropdownValue;
    }else if(keyWord == 'GPD of Pump'){
      cGPD = dropdownValue;
    }else if(keyWord == 'Flow Rate in GPM'){
      cFlowRate = dropdownValue;
    }else if(keyWord == 'Tank Size'){
      cTankSize = dropdownValue;
    }else if(keyWord == 'Iron Level' ){
      cIronLevel = dropdownValue;
    }else if(keyWord == 'Water Hardness'){
      cWaterHardness = dropdownValue;
    }else if(keyWord == 'PH Level'){
      cPHLevel = dropdownValue;
    }else{
      print('none');
    }
    notifyListeners();
  }

  void calculate(){
    var tankGPMIndex;
    var magic;
    var myIron = double.parse(this.cIronLevel);
    var tankList;
    var gph;
    // var runTime;

    var gal15 = [.15,.22,.33,.40,.50,.60,.67,.76,.85,.90];
    var gal30 = [.30,.45,.66,.81,1,1.2,1.35,1.53,1.71,1.8];
    var gal100 = [.9,1.5,2.1,2.7,3.3,3.9,4.5,5.1,5.7,6];

    switch(this.cFlowRate){
      case '15' : {
        tankGPMIndex = 0;
      }
      break;
      case '25' : {
        tankGPMIndex = 1;
      }
      break;
      case '35' : {
        tankGPMIndex = 2;
      }
      break;
      case '45' : {
        tankGPMIndex = 3;
      }
      break;
      case '55' : {
        tankGPMIndex = 4;
      }
      break;
      case '65' : {
        tankGPMIndex = 5;
      }
      break;
      case '75' : {
        tankGPMIndex = 6;
      }
      break;
      case '85' : {
        tankGPMIndex = 7;
      }
      break;
      case '95' : {
        tankGPMIndex = 8;
      }
      break;
      case '100' : {
        tankGPMIndex = 9;
      }
      break;

    }

    if (this.cSystemType == 'Injection'){
      switch(this.cGPD) {
        case '10': {
          magic = 4.8;
          gph = .21;
        }
        break;
        case '11': {
          magic = 4.36;
          gph = .23;

        }
        break;
        case '12': {
          magic = 4.00;
          gph = .25;

        }
        break;
        case '14': {
          magic = 3.43;
          gph = .29;

        }
        break;
        case '16': {
          magic = 4.80;
          gph = .33;

        }
        break;
        case '17': {
          magic = 2.83;
          gph = .36;

        }
        break;
        case '22': {
          magic = 2.16;
          gph = .45;

        }
        break;
        case '24': {
          magic = 2.00;
          gph = .50;

        }
        break;
        case '30': {
          magic = 1.60;
          gph = .62;

        }
        break;
        case '40': {
          magic = 1.2;
          gph = .83;

        }
        break;
      }
    }

    switch (this.cTankSize){
      case '15' : {
        tankList = gal15;
      }
      break;
      case '30' : {
        tankList = gal30;
      }
      break;
      case '100' : {
        tankList = gal100;
      }
      break;
    }
    if(this.cSystemType == 'Injection'){
      this.totalRunTime = double.parse(this.cTankSize)/gph;
      this.amt = tankList[tankGPMIndex]*myIron*magic;
    }

    this.amt = tankList[tankGPMIndex]*myIron;

    notifyListeners();

  }

  void clean(){
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