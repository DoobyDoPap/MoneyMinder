// ignore_for_file: avoid_web_libraries_in_flutter, unused_import, unused_local_variable

import 'dart:js';

import 'package:MoneyMinder/Pages/Home%20Page/home_page.dart';
import 'package:MoneyMinder/Pages/Home%20Page/login_page.dart';
import 'package:MoneyMinder/Pages/Home%20Page/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp(BuildContext context) {
    if (_usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      // Your signup logic here
      // You might want to navigate to the home page or show a confirmation message
      Navigator.pop(context); // Close the signup page
    } else {
      // Show a pop-up message if any of the fields is not entered
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter all required information.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK', style: TextStyle(color: Colors.red)),
              ),
            ],
          );
        },
      );
    }
  }

  void _goToLogin(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  signUp(BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      UiHelper.CustomAlertBox(context, "Enter Required Fields");
    } else {
      UserCredential? userCredential;
      try {
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print("Account Created Successfully");
        Navigator.pushReplacementNamed(
            context, '/home'); // Use pushReplacementNamed instead of push
      } on FirebaseAuthException catch (ex) {
        UiHelper.CustomAlertBox(context, ex.code.toString());
        print(ex.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0088FF), // Light Blue
                Color(0xFF004080), // Dark Blue
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 150.0,
                        width: 150.0,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'MoneyMinder',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                    labelText: 'Username',
                    hintText: 'Enter username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    labelText: 'Email',
                    hintText: 'Enter email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    labelText: 'Create Password',
                    hintText: 'Enter password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () async => await signUp(
                      Navigator.pushReplacementNamed(context, '/home')
                          as BuildContext,
                      _emailController.text.toString(),
                      _passwordController.text.toString()),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style:
                            TextStyle(fontSize: 16.0, color: Color(0xFF004080)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                TextButton(
                  onPressed: () => _goToLogin(context),
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/signup', // Set your initial route
      routes: {
        '/signup': (context) => SignUpPage(),
        '/home': (context) =>
            HomePage(), // Replace 'HomePage' with the actual home page widget
        '/login': (context) =>
            LoginPage(), // Replace 'LoginPage' with the actual login page widget
      },
    ),
  );
}
