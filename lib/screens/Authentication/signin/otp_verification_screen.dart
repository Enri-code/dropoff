import 'package:dropoff/utilities/extensions.dart';
import 'package:dropoff/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../widgets/dialogs/alert_dialog.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpPinInputed = "".obs;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25.0.h),
              child: Text(
                "Otp Verification",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0.h, bottom: 30.0.h),
              padding: EdgeInsets.symmetric(horizontal: 39.0.w),
              child: Text(
                "Enter the code to verify your number",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width * 0.7,
                fieldWidth: 35.0.w,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  otpPinInputed.value = pin;
                  print("COMPLETED: " + pin);
                  print("COMPLETED: " + pin);
                  print("COMPLETED: " + pin);
                },
              ),
            ),
            SizedBox(height: 20.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn’t recieve any code?",
                ),
                SizedBox(width: 2.0.w),
                InkWell(
                  onTap: () {
                    // Get.toNamed(AppRoutes.signUpScreen);
                  },
                  child: Text(
                    " Resend code",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),

            // Next Footer Button
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 30.0.h),
              child: DefaultButton(
                press: () {
                  openCustomDialog(
                    title: "Otp Successful!",
                    onTap: () {
                      Get.back();
                      // Get.to(const SetUpBizNameScreen());
                    },
                  );
                },
                text: "Verify",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
