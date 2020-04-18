import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            body1: TextStyle(color: Colors.black54),
          ),
        ),
        // home: WelcomeScreen(),
        initialRoute: WelcomeScreen.welcomeScreen,
        routes: {
          WelcomeScreen.welcomeScreen: (context) => WelcomeScreen(),
          RegistrationScreen.registrationScreen: (context) =>
              RegistrationScreen(),
          LoginScreen.login: (context) => LoginScreen(),
          ChatScreen.chatScreen: (context) => ChatScreen(),
        },
      ),
    );
  }
}
