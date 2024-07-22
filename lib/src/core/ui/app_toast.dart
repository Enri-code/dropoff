import 'package:dropoff/src/core/contants/app_color.dart';
import 'package:dropoff/src/core/ui/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
//   static final FToast fToast = FToast();

  static Widget _toast(_ToastType toastType, String message) => Container(
        width: 300.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColor.white,
          border: Border.all(color: AppColor.lightGrey),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: toastType.color,
              ),
              child: Icon(
                toastType.svg,
                color: AppColor.white,
                size: 15.w,
              ),
            ),
            10.horizontalSpace,
            Expanded(child: AppText.sp14(message).w400),
          ],
        ),
      );

  static _showToast(
    BuildContext context,
    _ToastType type,
    String message,
    Duration duration,
  ) {
//     fToast.init(context);
//     fToast.removeCustomToast();
//     fToast.showToast(
//       child: _toast(type, message),
//       positionedToastBuilder: (context, widget) {
//         return Positioned(
//           top: MediaQuery.of(context).padding.top + 8.h,
//           left: 0,
//           right: 0,
//           child: widget,
//         );
//       },
//       isDismissable: true,
//       toastDuration: duration,
//     );
  }

  static void warning(BuildContext context, String message,
          {Duration duration = const Duration(seconds: 3)}) =>
      _showToast(context, _ToastType.warning, message, duration);
  static void info(BuildContext context, String message,
          {Duration duration = const Duration(seconds: 3)}) =>
      _showToast(context, _ToastType.info, message, duration);
  static void success(BuildContext context, String message,
          {Duration duration = const Duration(seconds: 2)}) =>
      _showToast(context, _ToastType.success, message, duration);
}

enum _ToastType {
  info,
  warning,
  success;

  Color get color {
    switch (this) {
      case info:
        return AppColor.primary;
      case warning:
        return AppColor.red;
      case success:
        return AppColor.green;
    }
  }

  IconData get svg {
    switch (this) {
      case info:
        return Icons.info_outline;
      case warning:
        return Icons.warning_amber;
      case success:
        return Icons.check_circle_outline_rounded;
    }
  }
}
