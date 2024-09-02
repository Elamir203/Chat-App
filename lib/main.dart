import 'package:chat_app/Screens/chat_screen.dart';
import 'package:chat_app/Screens/login_screen.dart';
import 'package:chat_app/Screens/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BuzzChat());
}

class BuzzChat extends StatelessWidget {
  const BuzzChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SignUpScreen.id : (context) => SignUpScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        ChatScreen.id :(context) => ChatScreen(),
      },
      initialRoute: 'LogInScreen',
    );
  }
}

