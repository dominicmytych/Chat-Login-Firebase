// Flutter Package
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

// Dart Files
import './login_screen.dart';
import './registration_screen.dart';
import '../widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String route = "/welcome-screen";

  const WelcomeScreen({Key key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 280.0,
                    child: Image.asset('assets/meta/chat.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 28.0,
            ),
            RoundedButton(
              title: 'Sign In',
              colour: Colors.orange[300],
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.route);
              },
            ),
            RoundedButton(
              title: 'Create an account',
              colour: Colors.deepOrange[600],
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
