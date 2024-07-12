import 'package:dropoff/constants/colors.dart';
import 'package:dropoff/screens/Authentication/signin/sign_in_screen.dart';
import 'package:dropoff/services/firebase_global_method.dart';
import 'package:dropoff/utilities/extensions.dart';
import 'package:dropoff/widgets/buttons/default_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:country_picker_pro/country_picker_pro.dart';
import '../../../controllers/auth_cotroller.dart';
import '../../../page_routes/route_name.dart';
import '../../../widgets/textfields/app_text_field_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isVisible = false.obs;
    var authC = Get.find<AuthController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25.0.h),
              child: const Text(
                "Getting Started!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0.h, bottom: 50.0.h),
              padding: EdgeInsets.symmetric(horizontal: 39.0.w),
              child: const Text(
                "Enter your details and proceed to sign up",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: Column(
                children: [
                  AppTextField(
                    hintText: 'Name',
                    keybordType: TextInputType.name,
                    controller: authC.userNameTextController,
                    prefixIcon: Icons.person,
                    onPressedSuffixIcon: () {},
                  ),
                  AppTextField(
                    hintText: 'Email',
                    keybordType: TextInputType.emailAddress,
                    controller: authC.emailTextController,
                    prefixIcon: Icons.mail_outlined,
                    onPressedSuffixIcon: () {},
                  ),
                  AppTextField(
                    hintText: 'Phone',
                    keybordType: TextInputType.phone,
                    controller: authC.phoneNumberTextController,
                    prefixIcon: Icons.phone,
                    onPressedSuffixIcon: () {},
                  ),
                  AppTextField(
                    hintText: 'Address',
                    keybordType: TextInputType.streetAddress,
                    controller: authC.addressTextController,
                    prefixIcon: Icons.location_city,
                    onPressedSuffixIcon: () {},
                  ),
                  Obx(() {
                    return AppTextField(
                      hintText: 'Password',
                      controller: authC.passwordTextController,
                      obscureText: isVisible.value,
                      suffixIcon: isVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility,
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
              child: DefaultButton(
                text: "Sign Up",
                press: () async {
                  authC.signUpUser();
                },
              ),
            ),

            Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 50.0.w, vertical: 10.0.h),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already have an account?  ',
                    style: const TextStyle(
                        color: Colors.black), // Default text style
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: const TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(const SignInScreen());
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
