import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.blackColor13,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('جديد فى تطبيق ميرى', style: TextStyles.font16WhiteColorBold),
          verticalSpace(16),
          // Container(
          //   height: 120.h,
          //   width: double.infinity,
          //   margin: EdgeInsets.symmetric(horizontal: 16.w),
          //   decoration: BoxDecoration(
          //     color: AppColors.orangeColor48A.withValues(alpha: .4),
          //     borderRadius: BorderRadius.circular(12.r),
          //   ),
          // ),
          Container(
            height: 120.h,
            width: double.infinity,
            // padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
            margin: EdgeInsets.symmetric(horizontal: 14.w),
            decoration: BoxDecoration(
              color: AppColors.orangeColor48A,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Text(
                      'تم إضافة 20 عامل/عاملة من 3 جنسيات مختلفة جاهزون للعمل الآن! استكشف ملفاتهم الآن.',
                      style: TextStyles.font14BlackColor13W400,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 32.r,
                        width: 32.r,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.greenColor31,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_forward_outlined,
                          color: AppColors.whiteColor,
                        ),
                      ),

                      Image.asset(ImageAsset.sliderImage, fit: BoxFit.fill),
                    ],
                  ),
                ),
              ],
            ),
          ),

          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 12.r,
                width: 12.r,
                decoration: BoxDecoration(
                  color: AppColors.greyColor64,
                  shape: BoxShape.circle,
                ),
              ),
              horizontalSpace(4),
              Container(
                height: 12.r,
                width: 12.r,
                decoration: BoxDecoration(
                  color: AppColors.greyColor64,
                  shape: BoxShape.circle,
                ),
              ),
              horizontalSpace(4),
              Container(
                height: 12.r,
                width: 12.r,
                decoration: BoxDecoration(
                  color: AppColors.greyColor64,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
