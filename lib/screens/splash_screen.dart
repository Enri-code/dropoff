import 'package:dropoff/constants/colors.dart';
import 'package:dropoff/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//import '../../constants/locals.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // version variable
  String appVersion = "";

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    //getAppInfo();
    Future.delayed(const Duration(seconds: 1), () {
      Get.off(const HomeScreen(),
          transition: Transition.fadeIn, duration: const Duration(seconds: 4));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            // Image.asset(
            //   OliviaImages.playStoreImage,
            //   width: 100,
            //   height: 100,
            // ),
            SizedBox(height: 60),
            CupertinoActivityIndicator(
              color: AppColors.primaryColor,
              radius: 50,
            ),
            SizedBox(height: 30),
            Text("Drop off..."),
            Spacer(),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
