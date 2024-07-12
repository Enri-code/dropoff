import 'package:dropoff/constants/colors.dart';
import 'package:dropoff/screens/Authentication/signin/sign_in_screen.dart';
import 'package:dropoff/screens/Authentication/signup/sign_up_screen.dart';
import 'package:dropoff/utilities/extensions.dart';
import 'package:dropoff/widgets/buttons/default_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../controllers/auth_cotroller.dart';
import '../../../widgets/textfields/app_text_field_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                "Forgot Password!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0.h, bottom: 50.0.h),
              padding: EdgeInsets.symmetric(horizontal: 39.0.w),
              child: const Text(
                "We will send you a code to verify your email",
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
                ],
              ),
            ),

            // Next Footer Button
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 40.0.h),
              child: DefaultButton(
                text: "Send Code",
                press: () {
                  authC.forgotUserPassword();
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
