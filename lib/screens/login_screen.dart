import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String login = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;
  final _auth = FirebaseAuth.instance;
  bool setSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: setSpinner,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: kTextFieldDecoration,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: "Enter your password",
                      )),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    colour: loginButtonColour,
                    onPressing: () async {
                      setState(() {
                        setSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, ChatScreen.chatScreen);
                        }
                      } catch (e) {
                        print(e);
                      }
                      setState(() {
                        setSpinner = false;
                      });
                    },
                    stringValue: 'Log In',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
