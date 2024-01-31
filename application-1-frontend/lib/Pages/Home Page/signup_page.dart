// ignore_for_file: avoid_web_libraries_in_flutter, unused_import, unused_local_variable

import 'package:MoneyMinder/Pages/Home%20Page/home_page.dart';
import 'package:MoneyMinder/Pages/Home%20Page/login_page.dart';
import 'package:MoneyMinder/Pages/Home%20Page/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signUp(BuildContext context, String email, String password,
      String username) async {
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      UiHelper.CustomAlertBox(context, "Enter all required fields");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // After successful registration, update user profile with username
        await userCredential.user?.updateProfile(displayName: username);

        // You can also store additional user data in Firebase Firestore or Realtime Database
        // For example, storing user's username in Firestore
        // FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
        //   'username': username,
        // });

        print("Account Created Successfully");

        // Navigate to home page
        Navigator.pushReplacementNamed(context, '/home');
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
                    context,
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                    _usernameController.text.trim(),
                  ),
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

  void _goToLogin(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
    ),
  );
}
