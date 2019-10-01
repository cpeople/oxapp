import 'package:flutter/material.dart';

import 'signin.dart';
import 'signup.dart';
import 'profile_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => SignupPage(),
        '/profile_main': (BuildContext context) => ProfileMain()
      },
      home: SigninPage(),
    );
  }
}
