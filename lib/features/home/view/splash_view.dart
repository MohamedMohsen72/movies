import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netfliex/features/auth/view/login_view.dart';
import 'package:netfliex/features/navbar.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  User? user;

  Future<void> getuser() async {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
    Future.delayed(Duration(seconds: 3), () {
      return Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>(user!=null) ?NavBar() : LoginView(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/Animation.json')),
    );
  }
}
