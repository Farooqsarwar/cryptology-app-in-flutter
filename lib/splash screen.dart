import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';
import 'main_navigation.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);
  @override
  _Splash_screenState createState() => _Splash_screenState();
}
class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser;
      if (user != null) {
        Get.off(Screen2()); // Use Get.off to replace the current screen
      } else {
        Get.off(LoginScreen()); // Use Get.off to replace the current screen
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff98dce1), Color(0xff3f5efb)],
            stops: [0.25, 0.75],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/p9.jpg"),
              radius: 90,
            ),
            const SizedBox(height: 20),
            Container(
              width: 200, // Set the desired width here
              child: LinearProgressIndicator(
                color: Colors.yellow,
                minHeight: 3,
                backgroundColor: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
