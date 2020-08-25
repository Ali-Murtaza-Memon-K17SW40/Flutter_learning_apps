import 'package:flutter/material.dart';

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen After Splash'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Main Screen'),
      ),
    );
  }
}
