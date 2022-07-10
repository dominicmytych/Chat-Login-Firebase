// Flutter Package
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Dart Files
import './pages/welcome_screen.dart';
import './pages/login_screen.dart';
import './pages/registration_screen.dart';
import './pages/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: WelcomeScreen.route,
      routes: {
        ChatScreen.route: (context) => const ChatScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        RegistrationScreen.route: (context) => RegistrationScreen(),
        WelcomeScreen.route: (context) => const WelcomeScreen(),
      },
    );
  }
}
