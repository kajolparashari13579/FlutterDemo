import 'dart:async';

import 'package:flutter/material.dart';

import 'HomeTabPage.dart';
import 'SharedUtil.dart';
import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  getUserData() async {
    String? email = await SharedUtil.fetchData("email");
    if (email != null) {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeTabPage()),
        );
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Image.asset(
                "assets/images/background_image.jpg",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              const Center(
                  child: Text(
                "News Dekho",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
