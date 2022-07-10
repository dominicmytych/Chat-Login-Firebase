// ignore_for_file: avoid_print

import 'package:flashchat/pages/chat_screen.dart';
import 'package:flashchat/pages/registration_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  static String route = "/login-screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
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
              const SizedBox(height: 24.0),
              RoundedButton(
                title: 'Log in',
                colour: Colors.orange[300],
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  print(_email.text);
                  print(_password.text);
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _email.text, password: _password.text)
                      .then((value) {
                    Navigator.pushReplacementNamed(context, ChatScreen.route);
                    print("Sign In Successfull.");
                  }).onError((error, stackTrace) {
                    print("Sign In Error: ${error.toString()}");
                  });
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'New to FireChat? ',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(color: Colors.deepOrange),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushReplacementNamed(
                            context, RegistrationScreen.route),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
