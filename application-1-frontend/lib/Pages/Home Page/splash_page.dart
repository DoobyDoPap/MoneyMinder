import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 5, 9, 79),
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 60.0,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1.5,
                        ),
                  ),
                  Text(
                    '',
                  ),
                ],
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 500.0,
                width: 500.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
