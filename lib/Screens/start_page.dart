// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flashchat/Screens/login_screen.dart';
import 'package:flashchat/Screens/registration.dart';
import 'package:flutter/material.dart';

import '../components/MyButton.dart';

class StartingPage extends StatefulWidget {
  static String id = 'starting_screen';
  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller!, curve: Curves.decelerate);

    controller!.forward();
    controller!.addListener(() {
      setState(() {});
      // print(controller!.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SafeArea(
            child: Wrap(
              children: [
                // ignore: sized_box_for_whitespace
                Wrap(
                  children: [
                    Container(
                      child: Hero(
                        tag: 'logo',
                        child: Padding(
                          padding: const EdgeInsets.only(top: 36.0),
                          child: Icon(
                            Icons.bubble_chart,
                            color: Colors.black,
                            size: 90.0,
                          ),
                        ),
                      ),
                      height: animation!.value * 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 0, 0, 20),
                      child: Text(
                        'FLASH CHAT',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 120.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
          MyButton(
            label: 'Log In',
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
          MyButton(
              label: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              })
        ],
      ),
    );
  }
}
