// main.dart

// ignore_for_file: unused_import, depend_on_referenced_packages

// Import necessary packages and files


import 'package:finku_clone_slicing/Pages/Home%20Page/splash_page.dart';
import 'package:finku_clone_slicing/Utils/routes.dart';

import 'package:flutter/material.dart';

import 'Pages/Home Page/create_invoice.dart';
import 'Pages/Home Page/home_page.dart';
import 'Pages/Home Page/investment_page.dart';
import 'Pages/Home Page/login_page.dart';
import 'Pages/Home Page/make_a_budget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.budgetRoute: (context) => BudgetPage(),
        MyRoutes.invoiceRoute: (context) => InvoicePage(),
        MyRoutes.investmentRoute: (context) => InvestmentOptionsPage(),
        MyRoutes.splashRoute:(context) => SplashScreenPage(),
      },
    );
  }
}
