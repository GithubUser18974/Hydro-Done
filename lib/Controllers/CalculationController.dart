import 'package:flutter/material.dart';

class CalculationsProvider with ChangeNotifier {
  //Input-Vars
  String cSystemType = '';
  String cFlowRate = '';
  String cGPD = '';
  String cWaterHardness = '';
  String cTankSize = '';
  String cIronLevel = '';
  String cPHLevel = '';
  //Output-Vars
  double amt;
  double totalRunTime;
  //FilledChecks
  bool filled = false;

  void filledSetter(bool myBool) {
    filled = myBool;
    notifyListeners();
  }

  void setter(String keyWord, var dropdownValue) {
    if (keyWord == 'System Type') {
      cSystemType = dropdownValue;
    } else if (keyWord == 'GPD of Pump') {
      cGPD = dropdownValue;
    } else if (keyWord == 'Flow Rate in GPM') {
      cFlowRate = dropdownValue;
    } else if (keyWord == 'Tank Size') {
      cTankSize = dropdownValue;
    } else if (keyWord == 'Iron Level') {
      cIronLevel = dropdownValue;
    } else if (keyWord == 'Water Hardness') {
      cWaterHardness = dropdownValue;
    } else if (keyWord == 'PH Level') {
      cPHLevel = dropdownValue;
    } else {
      print('none');
    }
    notifyListeners();
  }

  void rustCalculations() {
    var tankGPMIndex;
    var magic;
    var myIron = double.parse(this.cIronLevel);
    var tankList;
    var gph;

    var rustGallon15 = [.15, .22, .33, .40, .50, .60, .67, .76, .85, .90];
    var rustGallon30 = [.30, .45, .66, .81, 1, 1.2, 1.35, 1.53, 1.71, 1.8];
    var rustGallon100 = [.9, 1.5, 2.1, 2.7, 3.3, 3.9, 4.5, 5.1, 5.7, 6];

    switch (this.cFlowRate) {
      case '15':
        {
          tankGPMIndex = 0;
        }
        break;
      case '25':
        {
          tankGPMIndex = 1;
        }
        break;
      case '35':
        {
          tankGPMIndex = 2;
        }
        break;
      case '45':
        {
          tankGPMIndex = 3;
        }
        break;
      case '55':
        {
          tankGPMIndex = 4;
        }
        break;
      case '65':
        {
          tankGPMIndex = 5;
        }
        break;
      case '75':
        {
          tankGPMIndex = 6;
        }
        break;
      case '85':
        {
          tankGPMIndex = 7;
        }
        break;
      case '95':
        {
          tankGPMIndex = 8;
        }
        break;
      case '100':
        {
          tankGPMIndex = 9;
        }
        break;
    }

    if (this.cSystemType == 'Injection') {
      switch (this.cGPD) {
        case '10':
          {
            magic = 4.8;
            gph = .21;
          }
          break;
        case '11':
          {
            magic = 4.36;
            gph = .23;
          }
          break;
        case '12':
          {
            magic = 4.00;
            gph = .25;
          }
          break;
        case '14':
          {
            magic = 3.43;
            gph = .29;
          }
          break;
        case '16':
          {
            magic = 4.80;
            gph = .21;
          }
          break;
        case '17':
          {
            magic = 2.83;
            gph = .36;
          }
          break;
        case '22':
          {
            magic = 2.16;
            gph = .45;
          }
          break;
        case '24':
          {
            magic = 2.00;
            gph = .50;
          }
          break;
        case '30':
          {
            magic = 1.60;
            gph = .62;
          }
          break;
        case '40':
          {
            magic = 1.2;
            gph = .83;
          }
          break;
      }
    }

    switch (this.cTankSize) {
      case '15':
        {
          tankList = rustGallon15;
        }
        break;
      case '30':
        {
          tankList = rustGallon30;
        }
        break;
      case '100':
        {
          tankList = rustGallon100;
        }
        break;
    }
    if (this.cSystemType == 'Injection') {
      this.totalRunTime = double.parse(this.cTankSize) / gph;
      this.amt = tankList[tankGPMIndex] * myIron * magic;
    } else {
      this.amt = tankList[tankGPMIndex] * myIron;
    }

    notifyListeners();
  }

  void calciumCalculations() {
    if (this.cTankSize == '30') {
            List gpdList10 = [
        .67,
        .86,
        1.06,
        1.25,
        1.73,
        2.11,
        2.59,
        2.98,
        3.46,
        3.84,
        4.32
      ];
      List gpdList11 = [
        .61,
        .78,
        .96,
        1.13,
        1.57,
        1.92,
        2.35,
        2.7,
        3.14,
        3.49,
        3.92
      ];
      List gpdList16 = [
        .42,
        .54,
        .66,
        .78,
        1.08,
        1.32,
        1.62,
        1.86,
        2.16,
        2.4,
        2.7
      ];
      List gpdList17 = [
        .8,
        1.02,
        1.25,
        1.48,
        2.04,
        2.5,
        3.07,
        3.52,
        4.09,
        4.54,
        5.11
      ];
      List gpdList22 = [
        .31,
        .39,
        .48,
        .57,
        .78,
        .96,
        1.18,
        1.35,
        1.57,
        1.74,
        1.96
      ];
      List gpdList24 = [
        .28,
        .36,
        .44,
        .52,
        .72,
        .88,
        1.08,
        1.24,
        1.44,
        1.6,
        1.8,
      ];
      var calciumIndex;
      var gph;
            switch (this.cFlowRate) {
        case '10':
          {
            calciumIndex = 0;
          }
          break;
        case '20':
          {
            calciumIndex = 1;
          }
          break;

        case '25':
          {
            calciumIndex = 2;
          }
          break;

        case '30':
          {
            calciumIndex = 3;
          }
          break;

        case '40':
          {
            calciumIndex = 4;
          }
          break;

        case '50':
          {
            calciumIndex = 5;
          }
          break;

        case '60':
          {
            calciumIndex = 6;
          }
          break;

        case '70':
          {
            calciumIndex = 7;
          }
          break;

        case '80':
          {
            calciumIndex = 8;
          }
          break;

        case '90':
          {
            calciumIndex = 9;
          }
          break;

        case '100':
          {
            calciumIndex = 10;
          }
      }
      switch(this.cGPD){
        case '10' : {
          this.amt = gpdList10[calciumIndex];
          gph = .21;
        }
        break;
        case '11' : {
          this.amt = gpdList11[calciumIndex];
          gph = .23;

        }
        break;
        case '16' : {
          this.amt = gpdList16[calciumIndex];
          gph = .33;

        }
        break;
        case '17' : {
          this.amt = gpdList17[calciumIndex];
          gph = .36;

        }
        break;
        case '22' : {
          this.amt = gpdList22[calciumIndex];
          gph = .45;

        }
        break;
        case '24' : {
          this.amt = gpdList24[calciumIndex];
          gph = .50;

        }
        break;
      }

      this.totalRunTime = 30/gph;
      this.amt = this.amt*double.parse(this.cWaterHardness)/10;


    } else {
            List gpdList10 = [
        1.44,
        2.88,
        3.55,
        4.32,
        5.76,
        7.2,
        8.64,
        10.08,
        11.52,
        12.96,
        14.4
      ];
      List gpdList11 = [
        1.31,
        2.62,
        3.23,
        3.92,
        5.23,
        6.54,
        7.85,
        9.16,
        10.46,
        11.77,
        13.08
      ];
      List gpdList16 = [0.9, 1.8, 2.22, 2.7, 3.6, 4.5, 5.4, 6.3, 7.2, 8.1, 9];
      List gpdList17 = [
        1.7,
        3.41,
        4.2,
        5.11,
        6.82,
        8.52,
        10.22,
        11.93,
        13.63,
        15.34,
        17.04
      ];
      List gpdList22 = [
        .65,
        1.31,
        1.61,
        1.96,
        2.62,
        3.27,
        3.92,
        4.58,
        5.23,
        5.89,
        6.54
      ];
      List gpdList24 = [.6, 1.2, 1.48, 1.8, 2.4, 3, 3.6, 4.2, 4.8, 5.4, 6];
      var calciumIndex;
      var gph;
            switch (this.cFlowRate) {
        case '10':
          {
            calciumIndex = 0;
          }
          break;
        case '20':
          {
            calciumIndex = 1;
          }
          break;

        case '25':
          {
            calciumIndex = 2;
          }
          break;

        case '30':
          {
            calciumIndex = 3;
          }
          break;

        case '40':
          {
            calciumIndex = 4;
          }
          break;

        case '50':
          {
            calciumIndex = 5;
          }
          break;

        case '60':
          {
            calciumIndex = 6;
          }
          break;

        case '70':
          {
            calciumIndex = 7;
          }
          break;

        case '80':
          {
            calciumIndex = 8;
          }
          break;

        case '90':
          {
            calciumIndex = 9;
          }
          break;

        case '100':
          {
            calciumIndex = 10;
          }
      }
      switch(this.cGPD){
        case '10' : {
          this.amt = gpdList10[calciumIndex];
          gph = .21;
        }
        break;
        case '11' : {
          this.amt = gpdList11[calciumIndex];
          gph = .23;

        }
        break;
        case '16' : {
          this.amt = gpdList16[calciumIndex];
          gph = .33;

        }
        break;
        case '17' : {
          this.amt = gpdList17[calciumIndex];
          gph = .36;

        }
        break;
        case '22' : {
          this.amt = gpdList22[calciumIndex];
          gph = .45;

        }
        break;
        case '24' : {
          this.amt = gpdList24[calciumIndex];
          gph = .50;

        }
        break;
      }

      this.totalRunTime = 100/gph;
            this.amt = this.amt*double.parse(this.cWaterHardness)/10;
    }
  }

  void clean() {
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
