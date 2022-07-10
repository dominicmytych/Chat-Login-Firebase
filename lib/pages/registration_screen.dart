// Flutter Package
// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/pages/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Dart Files
import '../utils/constants.dart';
import './chat_screen.dart';

import '../widgets/rounded_button.dart';

class RegistrationScreen extends StatefulWidget {
  static String route = "/registation-screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool spinner = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 280.0,
                child: Image.asset('assets/meta/chat.png'),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _email,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(hintText: 'Email'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              controller: _password,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(hintText: 'Password'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Sign up',
              colour: Colors.orange[300],
              onPressed: () async {
                await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _email.text, password: _password.text)
                    .then((value) {
                  Navigator.pushNamed(context, LoginScreen.route);
                }).onError((error, stackTrace) {
                  print("Error: ${error.toString()}");
                });
              },
            ),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Already have a account? ',
                style: const TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(
                    text: 'Log in',
                    style: const TextStyle(color: Colors.deepOrange),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushReplacementNamed(
                          context, LoginScreen.route),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
