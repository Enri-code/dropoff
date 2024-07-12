import 'package:dropoff/constants/colors.dart';
import 'package:dropoff/utilities/extensions.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? titleText;
  final String hintText;
  final bool isNumber;
  final bool isPassword;
  final String Function(String?)? validator;
  final bool readOnly;
  final bool obscureText;
  final TextInputType? keybordType;
  final TextEditingController controller;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onPressedSuffixIcon;
  final bool isNoBackgroundColor;
  final bool isNoPrefixIcon;
  final int maxLines;
  final int? lengthOfText;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.titleText,
    this.isNumber = false,
    this.isPassword = false,
    this.validator,
    this.readOnly = false,
    this.obscureText = false,
    this.isNoBackgroundColor = false,
    this.isNoPrefixIcon = false,
    this.keybordType,
    this.suffixIcon,
    this.prefixIcon,
    this.onPressedSuffixIcon,
    this.maxLines = 1,
    this.lengthOfText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20.0.h, 0, 10.0.h),
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            color: isNoBackgroundColor
                ? null
                : Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25.0.h),
          ),
          child: Container(
            // padding: EdgeInsets.fromLTRB(20.0.h, 0, 10.0.w, 0),
            child: TextFormField(
              keyboardType: isNumber
                  ? const TextInputType.numberWithOptions()
                  : (keybordType ?? TextInputType.text),
              readOnly: readOnly,
              controller: controller,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              obscureText: obscureText,
              obscuringCharacter: '*',
              maxLines: maxLines,
              maxLength: lengthOfText,
              expands: false,
              decoration: InputDecoration(
                enabledBorder: isNoBackgroundColor
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0.h),
                        borderSide:
                            const BorderSide(color: AppColors.primaryColor),
                      )
                    : InputBorder.none,
                border: isNoBackgroundColor
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      )
                    : InputBorder.none,
                hintText: hintText, // hint Text
                suffixIcon: suffixIcon == null
                    ? null
                    : IconButton(
                        onPressed: onPressedSuffixIcon,
                        icon: Icon(
                          suffixIcon,
                          color: Theme.of(context)
                              .iconTheme
                              .color!
                              .withOpacity(0.3),
                        ),
                      ),
                prefixIcon: isNoPrefixIcon
                    ? null
                    : Icon(
                        prefixIcon ?? Icons.lock,
                        color:
                            Theme.of(context).iconTheme.color!.withOpacity(0.3),
                      ),
              ),
              onTapOutside: (PointerDownEvent event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              validator: validator ??
                  (value) {
                    if (value!.isEmpty) {
                      return "Field cannot be empty";
                    }
                    return null;
                  },
            ),
          ),
        ),
      ),
    );
  }
}
