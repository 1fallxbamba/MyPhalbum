import 'package:flutter/material.dart';

import 'package:myphalbum/pages/login.dart';
import 'package:myphalbum/pages/register.dart';
import 'package:myphalbum/pages/intro_screen.dart';
import 'package:myphalbum/services/storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String? sliderStatus;

   getSliderStatus() async {
     String? _sliderStatus = await getLocalData("sliderStatus");
    setState(() {
      sliderStatus = _sliderStatus;
    });
  }

  @override
  void initState() {
    super.initState();
    getSliderStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/login": (context) => const LoginPage()
      },
      title: "My Phalbum",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white38,
        body: suitablePage()
      ),
    );
  }

  Widget suitablePage() {
     if(sliderStatus != null) {
       return const RegisterPage();
     } else {
       return const IntroScreen();
     }
  }

}


