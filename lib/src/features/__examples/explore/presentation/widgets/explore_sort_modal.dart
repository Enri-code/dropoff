import 'package:dropoff/src/core/contants/app_color.dart';
import 'package:dropoff/src/core/ui/app_text.dart';
import 'package:dropoff/src/features/__examples/explore/presentation/bloc/explore_bloc/explore_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreSortModal extends StatelessWidget {
  const ExploreSortModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      color: AppColor.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
        child: BlocBuilder<ExploreBloc, ExploreState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.h),
                    color: AppColor.lightGrey,
                  ),
                ),
                16.verticalSpace,
                AppText.sp18("Sort by").w500.black,
                24.verticalSpace,
              ],
            );
          },
        ),
      ),
    );
  }
}
