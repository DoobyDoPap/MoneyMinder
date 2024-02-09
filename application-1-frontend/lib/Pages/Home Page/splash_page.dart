import 'package:MoneyMinder/Pages/Home%20Page/login_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2), // Adjust the duration as needed
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LoginPage()), // Replace HomePage with your main content page
        );
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/SplashPage2.png', 
              height: MediaQuery.of(context).size.height * 0.972, 
            width: MediaQuery.of(context).size.width * 1.9, 
            ),
            SizedBox(height: 20.0),
            
          ],
        ),
      ),
    );
  }
}

class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
