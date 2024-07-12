import 'package:dropoff/constants/colors.dart';
import 'package:dropoff/screens/Authentication/forgot_password/forgot_password_screen.dart';
import 'package:dropoff/screens/Authentication/signup/sign_up_screen.dart';
import 'package:dropoff/utilities/extensions.dart';
import 'package:dropoff/widgets/buttons/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:country_picker_pro/country_picker_pro.dart';
import '../../../controllers/auth_cotroller.dart';
import '../../../page_routes/route_name.dart';
import '../../../widgets/textfields/app_text_field_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isVisible = false.obs;
    var authC = Get.find<AuthController>();
    final arguments = Get.arguments;
    if (arguments != null && arguments['email'] != null) {
      authC.emailTextController.text = arguments['email'];
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25.0.h),
              child: const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0.h, bottom: 50.0.h),
              padding: EdgeInsets.symmetric(horizontal: 39.0.w),
              child: const Text(
                "We will send you a code to verify your number telephone",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: Column(
                children: [
                  AppTextField(
                    hintText: 'Email',
                    keybordType: TextInputType.emailAddress,
                    controller: authC.emailTextController,
                    prefixIcon: Icons.mail_outlined,
                    onPressedSuffixIcon: () {},
                  ),
                  Obx(() {
                    return AppTextField(
                      hintText: 'Password',
                      controller: authC.passwordTextController,
                      obscureText: isVisible.value,
                      suffixIcon: isVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onPressedSuffixIcon: () {
                        isVisible.value = !isVisible.value;
                      },
                    );
                  }),
                ],
              ),
            ),

            // Next Footer Button
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 40.0.h),
              child: Column(
                children: [
                  DefaultButton(
                    text: "Sign In",
                    press: () {
                      authC.signInUser();
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const ForgotPasswordScreen());
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0.w, vertical: 10.0.h),
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 50.0.w, vertical: 10.0.h),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Do not have an account?  ',

                    style: const TextStyle(
                        color: Colors.black), // Default text style
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(const SignUpScreen());
                          },
                      ),
                    ],
                  ),
                )),
            Spacer(),
            Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 50.0.w, vertical: 30.0.h),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By joining our app you agree to our \n',
                    style: const TextStyle(
                        color: Colors.black), // Default text style
                    children: [
                      TextSpan(
                        text: 'Terms of use',
                        style: const TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      const TextSpan(
                        text: ' and ',
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      const TextSpan(
                        text: '.',
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
