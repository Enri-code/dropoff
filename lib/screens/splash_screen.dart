import 'package:dropoff/constants/colors.dart';
import 'package:dropoff/controllers/helper_method.dart';
import 'package:dropoff/screens/Authentication/signin/sign_in_screen.dart';
import 'package:dropoff/screens/home/home.dart';
import 'package:dropoff/services/firebase_global_method.dart';
import 'package:dropoff/utilities/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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

  splash() {}
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    //getAppInfo();
    Future.delayed(const Duration(seconds: 5), () async {
      if (await firebaseAuth.currentUser != null) {
        firebaseAuth.currentUser != null
            ? HelperMethods.readCurrentOnlineUserInfo()
            : null;

        Get.off(const HomeScreen());
      } else {
        Get.off(const SignInScreen());
      }
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
        // decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Image.asset(
            //   OliviaImages.playStoreImage,
            //   width: 100,
            //   height: 100,
            // ),
            const SizedBox(height: 40),
            Lottie.asset(
              'assets/splash_drive.json', // Replace with your Lottie file path
              width: MediaQuery.of(context).size.width / 2,
              height: 300.0.h,
            ),

            // SizedBox(height: 30),

            const Spacer(),
            const CupertinoActivityIndicator(
              color: AppColors.primaryColor,
              radius: 20,
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
