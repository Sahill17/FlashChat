// ignore_for_file: prefer_const_constructors

import 'package:flashchat/Screens/chat_screen.dart';
import 'package:flashchat/Screens/login_screen.dart';
import 'package:flashchat/Screens/registration.dart';
import 'package:flashchat/Screens/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(FlashChat());
}

// ignore: use_key_in_widget_constructors
class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: StartingPage.id,
      routes: {
        StartingPage.id: (context) => StartingPage(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen()
      },
    );
  }
}
