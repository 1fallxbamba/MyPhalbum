import 'package:flutter/material.dart';


import 'package:myphalbum/services/storage.dart';

import 'package:myphalbum/pages/login.dart';
import 'package:myphalbum/pages/register.dart';
import 'package:myphalbum/pages/intro_screen.dart';
import 'package:myphalbum/pages/home.dart';

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
  String? stayConnected;

   getSavedData() async {
     String? _sliderStatus = await getLocalData('sliderStatus');
     String? _stayConnected = await getLocalData('stayConnected');
    setState(() {
      sliderStatus = _sliderStatus;
      stayConnected = _stayConnected;
    });
  }

  @override
  void initState() {
    super.initState();
    getSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
      },
      title: 'My Phalbum',
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
       if(stayConnected != null) {
         return const HomePage();
       } else {
         return const LoginPage();
       }
     } else {
       return const IntroScreen();
     }
  }

}


