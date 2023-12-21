import 'dart:async';

import 'package:flutter/material.dart';
import 'package:abs_customer_sites/presentation/core/sign_in_page/sign_in_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // waiting on the splash page for 1 seconds and moving to signin page next
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      timer.cancel();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInPage()));
    });
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/logo.png',
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
