import 'package:dropoff/src/core/contants/app_color.dart';
import 'package:dropoff/src/core/utils/app_responses.dart';
import 'package:dropoff/src/core/ui/app_text.dart';
import 'package:dropoff/src/features/__examples/explore/presentation/cubit/explore_major_category_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExploreMajorCategoryCubit, ExploreMajorCategoryState>(
        bloc: context.read<ExploreMajorCategoryCubit>(),
        builder: (context, state) {
          if (state is ExploreMajorCategoryInitial) {
            context.read<ExploreMajorCategoryCubit>().getCategories();
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ExploreMajorCategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExploreMajorCategorySuccess) {
            return SafeArea(
              child: Column(
                children: [
                  30.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: TextField(),
                  ),
                  30.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        AppText.sp16("Major Categories").w500.black,
                        const Spacer(),
                        DropdownButton(
                          value: state.categoryType,
                          alignment: Alignment.centerRight,
                          underline: const SizedBox.shrink(),
                          elevation: 1,
                          padding: EdgeInsets.zero,
                          dropdownColor: AppColor.white,
                          icon: Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Icon(
                                CupertinoIcons.chevron_back,
                                size: 10.sp,
                                color: AppColor.black,
                              ),
                            ),
                          ),
                          items: MajorCategoryType.values
                              .map((cat) => DropdownMenuItem(
                                    value: cat,
                                    child: AppText.sp14(cat.displayName)
                                        .w400
                                        .black,
                                  ))
                              .toList(),
                          onChanged: (catType) {
                            if (catType != null) {
                              context
                                  .read<ExploreMajorCategoryCubit>()
                                  .changeCategoryType(catType);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            );
          } else {
            if (state is ExploreMajorCategoryFailed) {
              return Center(child: AppText.sp16(state.error.message));
            }
            return Center(child: AppText.sp16(AppError.unknown.message));
          }
        },
      ),
    );
  }
}
