// main.dart

// ignore_for_file: unused_import, depend_on_referenced_packages

// Import necessary packages and files

import 'package:finku_clone_slicing/Pages/Home%20Page/splash_page.dart';
import 'package:finku_clone_slicing/Pages/Investment/bonds_page.dart';
import 'package:finku_clone_slicing/Pages/Investment/crypto_market_page.dart';
import 'package:finku_clone_slicing/Pages/Investment/fixed_deposits.dart';
import 'package:finku_clone_slicing/Pages/Investment/gold_trade_page.dart';
import 'package:finku_clone_slicing/Pages/Investment/mutual_fund_page.dart';
import 'package:finku_clone_slicing/Pages/Investment/real_estate_page.dart';
import 'package:finku_clone_slicing/Pages/Investment/stock_market_page.dart';
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
        MyRoutes.splashRoute: (context) => SplashScreenPage(),
        MyRoutes.stockRoute: (context) => StockMarketPage(),
        MyRoutes.stockRoute: (context) => MyStockMarketApp(),
        MyRoutes.fdRoute: (context) => FixedDepositPage(),
        MyRoutes.mfRoute: (context) => MutualFundPage(),
        MyRoutes.estateRoute: (context) => RealEstatePage(),
        MyRoutes.goldRoute: (context) => GoldTradePage(),
        MyRoutes.bondsRoute: (context) => BondsPage(),
        MyRoutes.cryptoRoute: (context) => CryptoMarketPage(),
      },
    );
  }
}
