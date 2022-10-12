import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lafyuu/view/screens/cart_screen.dart';
import 'package:lafyuu/view/screens/login.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: EasySplashScreen(
          durationInSeconds: 2,
          showLoader: false,
          logo: Image.asset(
            'assets/images/splash.png',
          ),
          backgroundColor: const Color(0xFF40BFFF),
          navigator: LoginScreen(),
        ));
  }
}
