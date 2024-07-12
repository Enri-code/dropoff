import 'dart:convert';

import 'package:dropoff/constants/colors.dart';
import 'package:dropoff/page_routes/route_name.dart';
import 'package:dropoff/screens/Authentication/signin/sign_in_screen.dart';
import 'package:dropoff/screens/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/firebase_global_method.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  // text controllers
  var emailTextController = TextEditingController();
  var userNameTextController = TextEditingController();
  var phoneNumberTextController = TextEditingController();
  var addressTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  void onReady() {
    // Call your init()
    super.onReady();
  }

  @override
  void onClose() {
    // Dispose of the text controllers when the controller is closed

    super.onClose();
  }

  void signUpUser() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailTextController.text.trim(),
            password: passwordTextController.text.trim())
        .then((auth) async {
      currentUser = auth.user;

      if (currentUser != null) {
        Map userMap = {
          "id": currentUser!.uid,
          "name": userNameTextController.text.trim(),
          "email": emailTextController.text.trim(),
          "address": addressTextController.text.trim(),
          "phone": phoneNumberTextController.text.trim(),
        };

        DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child("users");
        userRef.child(currentUser!.uid).set(userMap);

        Get.snackbar(
          'Sign Up',
          'Successfully Registered',
          colorText: Colors.black,
          backgroundColor: AppColors.primaryColor,
          snackPosition: SnackPosition.TOP,
          maxWidth: Get.width,
        );

        emailTextController.clear();
        userNameTextController.clear();
        phoneNumberTextController.clear();
        addressTextController.clear();
        passwordTextController.clear();

        Get.toNamed(AppRoutes.signInScreen, arguments: {
          'email': emailTextController.text.trim(),
        });
      }
    }).catchError((onError) {
      Get.snackbar(
        'Sign Up Error occured!',
        '$onError',
        colorText: Colors.white,
        backgroundColor: AppColors.lightSecondaryColor,
        snackPosition: SnackPosition.TOP,
        maxWidth: Get.width,
      );
    });
  }

  void signInUser() async {
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailTextController.text.trim(),
            password: passwordTextController.text.trim())
        .then((auth) async {
      currentUser = auth.user;
      Get.snackbar(
        'Sign Up',
        'Login Successful!',
        colorText: Colors.black,
        backgroundColor: AppColors.primaryColor,
        snackPosition: SnackPosition.TOP,
        maxWidth: Get.width,
      );
      Get.to(HomeScreen());
    }).catchError((onError) {
      Get.snackbar(
        'Sign Up Error occured!',
        '$onError',
        colorText: Colors.white,
        backgroundColor: AppColors.lightSecondaryColor,
        snackPosition: SnackPosition.TOP,
        maxWidth: Get.width,
      );
    });
  }

  void forgotUserPassword() async {
    firebaseAuth
        .sendPasswordResetEmail(email: emailTextController.text.trim())
        .then((value) {
      Get.snackbar(
        'Forgot Password',
        'Check your email for a recovery code!',
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
        snackPosition: SnackPosition.TOP,
        maxWidth: Get.width,
      );
    }).onError((error, stackTrace) {
      Get.snackbar(
        'Sign Up Error occured!',
        '$error',
        colorText: Colors.white,
        backgroundColor: AppColors.lightSecondaryColor,
        snackPosition: SnackPosition.TOP,
        maxWidth: Get.width,
      );
    });
  }
}
