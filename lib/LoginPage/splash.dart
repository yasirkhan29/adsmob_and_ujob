import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ujob/LoginPage/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment(0, -0.50),
              child: Image.asset(
                ('images/logo.png'),
                height: 210,
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  'ujob is Here for you',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'medium',
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
