import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mery_comercial_app/features/notifications/logic/notifications_cubit.dart';
import 'package:mery_comercial_app/features/notifications/logic/notifications_state.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';

import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/button_widget.dart';
import 'package:shimmer/shimmer.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              context.pop();
            }
          },
          icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
        ),
        title: Text('الاشعارات', style: TextStyles.font18WhiteColorW600),
        backgroundColor: AppColors.greenColor31,
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<NotificationsCubit, NotificationsState>(
          // buildWhen: (previous, current) {
          //   return current is OnGetNotiLoadingState ||
          //       current is OnGetDetailsSuccessState ||
          //       current is OnGetDetailsErrorState ||
          //       current is OnGetDetailsCatchErrorState;
          // },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(16),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 14.r,
                              width: 14.r,
                              decoration: BoxDecoration(
                                color: AppColors.orangeColor09,
                                shape: BoxShape.circle,
                              ),
                            ),

                            horizontalSpace(8),
                            Text(
                              'تم قبول طلب توظيفك',
                              style: TextStyles.font14BlackColor13bold,
                            ),
                          ],
                        ),
                        verticalSpace(4),
                        Text(
                          'تم تحديث عقدك. يرجى مراجعة التفاصيل الجديدة في صفحة العقود.',
                          style: TextStyles.font14greyColor64w400,
                        ),
                        verticalSpace(4),
                        Text(
                          '5 يناير, 2025',
                          style: TextStyles.font12greyColor64w400,
                        ),
                      ],
                    ),
                  ),
                  Divider(color: AppColors.greyColorE3),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 14.r,
                              width: 14.r,
                              decoration: BoxDecoration(
                                color: AppColors.orangeColor09,
                                shape: BoxShape.circle,
                              ),
                            ),

                            horizontalSpace(8),
                            Text(
                              'تم قبول طلب توظيفك',
                              style: TextStyles.font14BlackColor13bold,
                            ),
                          ],
                        ),
                        verticalSpace(4),
                        Text(
                          'تم تحديث عقدك. يرجى مراجعة التفاصيل الجديدة في صفحة العقود.',
                          style: TextStyles.font14greyColor64w400,
                        ),
                        verticalSpace(4),
                        Text(
                          '5 يناير, 2025',
                          style: TextStyles.font12greyColor64w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
            if (state is OnGetNotificationsLoadingState &&
                NotificationsCubit.get(context).cvDetailsResponseModel ==
                    null) {
              return Column(
                children: List.generate(
                  1,
                  (index) => Padding(
                    padding: EdgeInsets.only(top: 12.w),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 160.h,
                        width: double.infinity,
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
                            Container(color: Colors.grey.shade300),
                            verticalSpace(8),
                            Container(color: Colors.grey.shade300),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              if (NotificationsCubit.get(context).cvDetailsResponseModel ==
                  null) {
                return Center(child: Icon(Icons.image_not_supported_outlined));
              } else {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(16),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 14.r,
                                  width: 14.r,
                                  decoration: BoxDecoration(
                                    color: AppColors.orangeColor09,
                                    shape: BoxShape.circle,
                                  ),
                                ),

                                horizontalSpace(8),
                                Text(
                                  'تم قبول طلب توظيفك',
                                  style: TextStyles.font14BlackColor13bold,
                                ),
                              ],
                            ),
                            verticalSpace(4),
                            Text(
                              'تم تحديث عقدك. يرجى مراجعة التفاصيل الجديدة في صفحة العقود.',
                              style: TextStyles.font14greyColor64w400,
                            ),
                            verticalSpace(4),
                            Text(
                              '5 يناير, 2025',
                              style: TextStyles.font12greyColor64w400,
                            ),
                          ],
                        ),
                      ),
                      Divider(color: AppColors.greyColorE3),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 14.r,
                                  width: 14.r,
                                  decoration: BoxDecoration(
                                    color: AppColors.orangeColor09,
                                    shape: BoxShape.circle,
                                  ),
                                ),

                                horizontalSpace(8),
                                Text(
                                  'تم قبول طلب توظيفك',
                                  style: TextStyles.font14BlackColor13bold,
                                ),
                              ],
                            ),
                            verticalSpace(4),
                            Text(
                              'تم تحديث عقدك. يرجى مراجعة التفاصيل الجديدة في صفحة العقود.',
                              style: TextStyles.font14greyColor64w400,
                            ),
                            verticalSpace(4),
                            Text(
                              '5 يناير, 2025',
                              style: TextStyles.font12greyColor64w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
