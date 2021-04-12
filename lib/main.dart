import 'package:flutter/material.dart';
import 'package:hydro_app/Pages/RustPreventionPage.dart';
import 'package:provider/provider.dart';

import 'Controllers/CalculationController.dart';
import 'Pages/CalciumPreventionPage.dart';
import 'Pages/CalciumResultsPage.dart';
import 'Pages/InjectionPage.dart';
import 'Pages/InjectionResultsPage.dart';
import 'Pages/MyHomePage.dart';
import 'Pages/SiphoningPage.dart';
import 'Pages/SiphoningResultsPage.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CalculationsProvider>(create: (_) => CalculationsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/MyHomePage',
      routes: {
        '/MyHomePage': (context) => MyHomePage(),
        '/RustPreventionPage': (context) => RustPreventionPage(),
        '/InjectionPage': (context) => InjectionPage(),
        '/SiphoningPage': (context) => SiphoningPage(),
        '/CalciumPreventionPage': (context) => CalciumPreventionPage(),
        '/CalciumResultPage': (context) =>  CalciumResultPage(),
        '/SiphoningResultPage': (context) => SiphoningResultPage(),
        '/InjectionResultPage': (context) => InjectionResultPage(),
      },
    );
  }
}




