// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flashchat/Screens/chat_screen.dart';
import 'package:flashchat/components/MyButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../costants.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: loading,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 60.0,
                    ),
                    Container(
                      height: 200.0,
                      child: Hero(
                        tag: 'logo',
                        child: Icon(
                          Icons.bubble_chart,
                          color: Colors.black,
                          size: 125.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (Value) {
                        email = Value;
                      },
                      style: TextStyle(color: Colors.black),
                      autocorrect: true,
                      cursorColor: Colors.black,
                      decoration: TextFieldStyle()
                          .copyWith(hintText: 'Enter your email'),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      onChanged: (Value) {
                        password = Value;
                      },
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      obscuringCharacter: '*',
                      cursorColor: Colors.black,
                      decoration: TextFieldStyle()
                          .copyWith(hintText: 'Enter your password'),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    MyButton(
                        label: 'Log In',
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email!, password: password!);
                            if (user != null) {
                              Navigator.pushNamed(context, ChatScreen.id);
                            }
                            setState(() {
                              loading = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        })
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
