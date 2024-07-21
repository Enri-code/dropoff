import 'package:dropoff/src/core/contants/app_color.dart';
import 'package:dropoff/src/core/enums/button_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton {
  static Widget primary({
    required String text,
    required void Function()? onTap,
    ButtonStatus status = ButtonStatus.active,
  }) {
    return InkWell(
      onTap: status.isActive ? onTap : null,
      child: Container(
        height: 58.sp,
        width: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: status.isDisabled ? AppColor.lightGrey : AppColor.primary,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: status.isLoading
            ? _loader()
            : Text(
                text,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.white,
                ),
              ),
      ),
    );
  }

  // static Widget secondary({
  //   required String text,
  //   required void Function()? onTap,
  //   ButtonStatus status = ButtonStatus.active,
  // }) {
  //   return InkWell(
  //     onTap: status.isActive ? onTap : null,
  //     child: Container(
  //       height: 58.sp,
  //       width: double.maxFinite,
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //         color: AppColor.whiteBlue,
  //         borderRadius: BorderRadius.circular(10.r),
  //       ),
  //       child: status.isLoading
  //           ? _loader(AppColor.primary)
  //           : Text(
  //               text,
  //               style: TextStyle(
  //                 fontSize: 17.sp,
  //                 fontWeight: FontWeight.w700,
  //                 color: AppColor.primary,
  //               ),
  //             ),
  //     ),
  //   );
  // }

  static Widget _loader([Color color = AppColor.white]) => SizedBox(
        height: 30.r,
        width: 30.r,
        child: CircularProgressIndicator(
          color: color,
          strokeCap: StrokeCap.round,
        ),
      );
}
