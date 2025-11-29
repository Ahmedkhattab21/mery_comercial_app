import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/home/logic/home_cubit.dart';
import 'package:mery_comercial_app/features/home/logic/home_state.dart';
import 'package:shimmer/shimmer.dart';

class NationalityWidget extends StatelessWidget {
  const NationalityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is OnGetNationalityLoadingState ||
            current is OnGetNationalityErrorState ||
            current is OnGetNationalitySuccessState ||
            current is OnGetNationalityCatchErrorState;
      },
      builder: (context, state) {

        if (state is OnGetNationalityLoadingState &&
            HomeCubit.get(context).nationalities.isEmpty) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 120.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 20.h,
                            width: 70.w,
                            color: Colors.grey.shade300,
                          ),
                          verticalSpace(8),
                          Container(
                            height: 60.h,
                            width: 90.w,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: HomeCubit.get(context).nationalities
                  .map(
                    (item) => Container(
                      margin: EdgeInsets.only(right: 8.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.orangeColor48A,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          Text(
                            item.name,
                            style: TextStyles.font14BlackColor13W400,
                          ),
                          verticalSpace(8),
                          Image.asset(ImageAsset.sliderImage, fit: BoxFit.fill),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        }
      },
    );
  }
}
