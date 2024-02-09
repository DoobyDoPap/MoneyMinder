// main.dart

// ignore_for_file: unused_import, depend_on_referenced_packages

// Import necessary packages and files

import 'package:MoneyMinder/Pages/Home%20Page/activate_page.dart';
import 'package:MoneyMinder/Pages/Home%20Page/last_transaction.dart';
import 'package:MoneyMinder/Pages/Home%20Page/learn_from_us.dart';
import 'package:MoneyMinder/Pages/Home%20Page/signup_page.dart';
import 'package:MoneyMinder/Pages/Home%20Page/splash_page.dart';
import 'package:MoneyMinder/Pages/Home%20Page/target_page.dart';
import 'package:MoneyMinder/Pages/Interesting%20Features/split_bills.dart';
import 'package:MoneyMinder/Pages/Interesting%20Features/achievements_page.dart';
import 'package:MoneyMinder/Pages/Interesting%20Features/split_bills_1.dart';
import 'package:MoneyMinder/Pages/Investment/bonds_page.dart';
import 'package:MoneyMinder/Pages/Investment/crypto_market_page.dart';
import 'package:MoneyMinder/Pages/Investment/fixed_deposits.dart';
import 'package:MoneyMinder/Pages/Investment/gold_trade_page.dart';
import 'package:MoneyMinder/Pages/Investment/mutual_fund_page.dart';
import 'package:MoneyMinder/Pages/Investment/real_estate_page.dart';
import 'package:MoneyMinder/Pages/Investment/sip_page.dart';
import 'package:MoneyMinder/Pages/Investment/stock_market_page.dart';
import 'package:MoneyMinder/Utils/firebase_options.dart';
import 'package:MoneyMinder/Utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../Pages/Home Page/create_invoice.dart';
import '../Pages/Home Page/home_page.dart';
import '../Pages/Home Page/investment_page.dart';
import '../Pages/Home Page/login_page.dart';
import '../Pages/Home Page/make_a_budget.dart';

main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.budgetRoute: (context) => BudgetPage(),
        MyRoutes.invoiceRoute: (context) => InvoicePage(),
        MyRoutes.investmentRoute: (context) => InvestmentOptionsPage(),
        MyRoutes.splashRoute: (context) => SplashScreen(),
        MyRoutes.stockRoute: (context) => StockMarketPage(),
        MyRoutes.stockRoute: (context) => MyStockMarketApp(),
        MyRoutes.fdRoute: (context) => FixedDepositPage(),
        MyRoutes.mfRoute: (context) => MutualFundPage(),
        MyRoutes.estateRoute: (context) => RealEstatePage(),
        MyRoutes.goldRoute: (context) => GoldTradePage(),
        MyRoutes.bondsRoute: (context) => BondsPage(),
        MyRoutes.cryptoRoute: (context) => CryptoMarketPage(),
        MyRoutes.sipRoute: (context) => SIPPage(),
        MyRoutes.achievementRoute: (context) => AchievementPage(),
        MyRoutes.transactionRoute: (context) => TransactionHistoryPage(),
        // MyRoutes.splitbillsRoute: (context) => SplitBillsPage(),
        MyRoutes.split_billsRoute: (context) => SplitBillsApp(),
        MyRoutes.targetRoute: (context) => TargetPage(),
        MyRoutes.activateRoute: (context) => LoanApplicationPage(),
        MyRoutes.learnRoute: (context) => UserGuidePage(),
        MyRoutes.signupRoute: (context) => SignUpPage(),

        // MyRoutes._homePage: (context) => _HomePage(),
      },
    );
  }
}
