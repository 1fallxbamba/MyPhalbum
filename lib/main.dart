import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:myphalbum/pages/login.dart';
import 'package:myphalbum/pages/register.dart';
import 'package:myphalbum/pages/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginPage()
      },
      title: 'My Phalbum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white38,
        body: const IntroScreen()
      ),
    );
  }
}
