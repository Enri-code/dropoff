import 'package:dropoff/constants/colors.dart';
import 'package:dropoff/utilities/extensions.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.press,
    this.isProcessing = false,
  });

  final String text;
  final VoidCallback? press;
  final bool isProcessing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0.h,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
          (Set<MaterialState> states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            );
          },
        ), backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
          return AppColors.primaryColor;
        })),
        onPressed: isProcessing ? null : press,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
