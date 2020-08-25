import 'package:flutter/material.dart';
import 'package:splash_screen_demo_2/screens/after_splash.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.orangeAccent,
      image: Image.asset('images/google.png'),
      photoSize: 150.0,
      navigateAfterSeconds: AfterSplash(),
      loaderColor: Colors.white,
      loadingText: Text('Loading...'),
    );
  }
}
