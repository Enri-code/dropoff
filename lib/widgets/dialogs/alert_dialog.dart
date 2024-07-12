import 'package:dropoff/constants/colors.dart';
import 'package:dropoff/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/images.dart';

void openCustomDialog({required String title, VoidCallback? onTap}) {
  showDialog(
    context: Get.context!,
    builder: (context) {
      return StatefulBuilder(builder: (context, setStateForDialog) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          backgroundColor: AppColors.kGreyColor.withOpacity(0.7),
          scrollable: true,
          elevation: 20,
          title: Text(
            title, // title
            textAlign: TextAlign.center,
          ),
          contentPadding: EdgeInsets.all(5.0.h),
          content: Column(
            children: [
              SizedBox(
                  height: 150,
                  width: 150,
                  child: SvgPicture.asset(AppImages.navigatorSvg)),
              const Divider(color: Colors.black12),
              TextButton(
                onPressed: onTap ??
                    () {
                      Get.back();
                    },
                child: Text(
                  ">",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        );
      });
    },
  );
}
