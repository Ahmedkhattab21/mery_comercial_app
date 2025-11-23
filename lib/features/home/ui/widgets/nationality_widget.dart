import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';

class NationalityWidget extends StatelessWidget {
  const NationalityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
            decoration: BoxDecoration(
                color: AppColors.orangeColor48A,
                borderRadius: BorderRadius.circular(12.r)
            ),
            child: Column(
              children: [
                Text('عاملة منزلية' ,style: TextStyles.font14BlackColor13W400),
                verticalSpace(8),
                Image.asset(ImageAsset.sliderImage, fit: BoxFit.fill),
              ],
            ),
          ),
          horizontalSpace(12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
            decoration: BoxDecoration(
                color: AppColors.orangeColor48A,
                borderRadius: BorderRadius.circular(12.r)
            ),
            child: Column(
              children: [
                Text('عاملة منزلية' ,style: TextStyles.font14BlackColor13W400),
                verticalSpace(8),
                Image.asset(ImageAsset.sliderImage, fit: BoxFit.fill),
              ],
            ),
          ),
          horizontalSpace(12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
            decoration: BoxDecoration(
                color: AppColors.orangeColor48A,
                borderRadius: BorderRadius.circular(12.r)
            ),
            child: Column(
              children: [
                Text('عاملة منزلية' ,style: TextStyles.font14BlackColor13W400),
                verticalSpace(8),
                Image.asset(ImageAsset.sliderImage, fit: BoxFit.fill),
              ],
            ),
          ),
          horizontalSpace(12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
            decoration: BoxDecoration(
                color: AppColors.orangeColor48A,
                borderRadius: BorderRadius.circular(12.r)
            ),
            child: Column(
              children: [
                Text('عاملة منزلية' ,style: TextStyles.font14BlackColor13W400),
                verticalSpace(8),
                Image.asset(ImageAsset.sliderImage, fit: BoxFit.fill),
              ],
            ),
          ),
          horizontalSpace(12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
            decoration: BoxDecoration(
                color: AppColors.orangeColor48A,
                borderRadius: BorderRadius.circular(12.r)
            ),
            child: Column(
              children: [
                Text('عاملة منزلية' ,style: TextStyles.font14BlackColor13W400),
                verticalSpace(8),
                Image.asset(ImageAsset.sliderImage, fit: BoxFit.fill),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
