import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/home/ui/widgets/cvs_widget.dart';
import 'package:mery_comercial_app/features/home/ui/widgets/favorite_cvs_widget.dart';
import 'package:mery_comercial_app/features/home/ui/widgets/nationality_widget.dart';
import 'package:mery_comercial_app/features/categories/ui/categories_widget.dart';
import 'package:mery_comercial_app/features/home/ui/widgets/offices_slider_widget.dart';
import 'package:mery_comercial_app/features/home/ui/widgets/slider_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Green header ──────────────────────────────────────
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.greenColor31,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28.r),
                    bottomRight: Radius.circular(28.r),
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding:
                        EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 20.h),
                    child: Column(
                      children: [
                        // Top row: avatar + greeting + notification
                        Row(
                          children: [
                            // Avatar
                            Container(
                              width: 46.r,
                              height: 46.r,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.orangeColor48A,
                                  width: 2,
                                ),
                                color: Colors.white,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  ImageAsset.meryIcon,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            horizontalSpace(12),
                            // Greeting
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'أهلاً بك! 👋',
                                    style: TextStyles.font18WhiteColorW600,
                                  ),
                                  verticalSpace(2),
                                  Text(
                                    'ابحث عن أفضل العمالة المنزلية',
                                    style:
                                        TextStyles.font14WhiteColorW400
                                            .copyWith(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Notification bell
                            GestureDetector(
                              onTap: () => context
                                  .pushNamed(Routes.notificationsScreen),
                              child: Container(
                                padding: EdgeInsets.all(10.r),
                                decoration: const BoxDecoration(
                                  color: Colors.white24,
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  ImageAsset.notificationIcon,
                                  width: 20.r,
                                  height: 20.r,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(16),
                        // Promo banner card
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.25),
                            ),
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                              // Text side
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 12.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'آلاف السير الذاتية',
                                        style:
                                            TextStyles.font18WhiteColorW600,
                                      ),
                                      verticalSpace(4),
                                      Text(
                                        'اختر الكفاءات المناسبة\nمن العمالة المنزلية',
                                        style: TextStyles.font12WhiteColorW400
                                            .copyWith(
                                          color: Colors.white70,
                                        ),
                                      ),
                                      verticalSpace(10),
                                      GestureDetector(
                                        onTap: () => context.pushNamed(
                                            Routes.allCvsScreen),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 14.w,
                                            vertical: 6.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                          child: Text(
                                            'اعرف أكثر',
                                            style: TextStyles
                                                .font12blackColor13W400
                                                .copyWith(
                                              color: AppColors.greenColor31,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Image side
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  bottomLeft: Radius.circular(20.r),
                                ),
                                child: Image.asset(
                                  ImageAsset.sliderImage,
                                  width: 130.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // ── Body content ─────────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(16),
                    SliderWidget(),
                    verticalSpace(16),
                    CategoriesWidget(),
                    verticalSpace(16),
                    OfficesSliderWidget(),
                    verticalSpace(16),
                    NationalityWidget(),
                    verticalSpace(16),
                    FavoriteCvsWidget(),
                    verticalSpace(16),
                    CvsWidget(),
                    verticalSpace(40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void showLogOutBottomSheet(BuildContext context, ProfileCubit cubit) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.white,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
  //     ),
  //     builder: (BuildContext context) {
  //       return Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min, // Make bottom sheet fit content
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Container(
  //               height: 4.h,
  //               width: 100.w,
  //               decoration: BoxDecoration(
  //                 color: AppColors.greyColor,
  //                 borderRadius: BorderRadius.circular(20.r),
  //               ),
  //             ),
  //             verticalSpace(24),
  //             SvgPicture.asset(ImageAsset.logOutIcon),
  //             verticalSpace(24),
  //             Text(
  //               'Leaving so soon?',
  //               style: TextStyles.font50BlackColorW500.copyWith(
  //                 color: AppColors.blackColor,
  //               ),
  //             ),
  //             verticalSpace(8),
  //             Text(
  //               "If you log out, you’ll need to sign in again next time.  We’ll save your nights for when you’re back ✨",
  //               textAlign: TextAlign.center,
  //               style: TextStyles.font13blackColorW400,
  //             ),
  //             verticalSpace(16),
  //
  //             ButtonWidget(
  //               isLoading: false,
  //               borderRadius: 50,
  //               buttonHeight: 46.h,
  //               buttonText: "Stay Logged In",
  //               backGroundColor: AppColors.blackColor,
  //               borderColor: AppColors.blackColor,
  //               textStyle: TextStyles.font16whiteColorW600.copyWith(
  //                 color: AppColors.whiteColor,
  //               ),
  //               onPressed: () {
  //                 context.pop();
  //               },
  //             ),
  //             verticalSpace(16),
  //             Center(
  //               child: GestureDetector(
  //                 onTap: () async {
  //                   cubit.logOut();
  //                   await CacheHelper.removeSecureData(
  //                     ConstantKeys.saveTokenToShared,
  //                   );
  //                   await CacheHelper.removeSecureData(
  //                     ConstantKeys.saveUserTypeToShared,
  //                   );
  //                   context.pushNamedAndRemoveUntil(
  //                     Routes.onBoardingScreen,
  //                     predicate: (predicate) => false,
  //                   );
  //                 },
  //                 child: Text(
  //                   'Log Me Out',
  //                   style: TextStyles.font18RedColorW600.copyWith(
  //                     color: AppColors.blackColor,
  //                     decoration: TextDecoration.underline,
  //                     decorationColor: AppColors.blackColor,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             verticalSpace(24),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  //
  // void showSupportBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.white,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
  //     ),
  //     builder: (BuildContext context) {
  //       return SingleChildScrollView(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min, // Make bottom sheet fit content
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Container(
  //               height: 4.h,
  //               width: 100.w,
  //               decoration: BoxDecoration(
  //                 color: AppColors.greyColor,
  //                 borderRadius: BorderRadius.circular(20.r),
  //               ),
  //             ),
  //             verticalSpace(24),
  //             Text(
  //               'Contact Affiliate',
  //               style: TextStyles.font50BlackColorW500.copyWith(
  //                 color: AppColors.blackColor,
  //               ),
  //             ),
  //             verticalSpace(12),
  //             GestureDetector(
  //               onTap: () {
  //                 AppConstant.openUrl(AppConstant.website);
  //               },
  //               child: Row(
  //                 children: [
  //                   SvgPicture.asset(ImageAsset.websiteIcon),
  //                   horizontalSpace(8),
  //                   Expanded(
  //                     child: Text(
  //                       AppConstant.website,
  //                       maxLines: 1,
  //                       style: TextStyles.font14BlackColorW400,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             verticalSpace(12),
  //             GestureDetector(
  //               onTap: () {
  //                 Clipboard.setData(ClipboardData(text: AppConstant.email));
  //               },
  //               child: Row(
  //                 children: [
  //                   SvgPicture.asset(ImageAsset.emailIcon),
  //                   horizontalSpace(8),
  //                   Expanded(
  //                     child: Text(
  //                       AppConstant.email,
  //                       maxLines: 1,
  //                       style: TextStyles.font14BlackColorW400,
  //                     ),
  //                   ),
  //                   horizontalSpace(8),
  //                   SvgPicture.asset(ImageAsset.copyIcon),
  //                 ],
  //               ),
  //             ),
  //
  //             verticalSpace(12),
  //             GestureDetector(
  //               onTap: () {
  //                 AppConstant.openUrl(AppConstant.youtube);
  //               },
  //               child: Row(
  //                 children: [
  //                   SvgPicture.asset(ImageAsset.youtubeIcon),
  //                   horizontalSpace(8),
  //                   Expanded(
  //                     child: Text(
  //                       AppConstant.youtube,
  //                       maxLines: 1,
  //                       style: TextStyles.font14BlackColorW400,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             verticalSpace(12),
  //
  //             GestureDetector(
  //               onTap: () {
  //                 AppConstant.openUrl(AppConstant.linkedin);
  //               },
  //               child: Row(
  //                 children: [
  //                   SvgPicture.asset(ImageAsset.linkedinIcon),
  //                   horizontalSpace(8),
  //                   Expanded(
  //                     child: Text(
  //                       AppConstant.linkedin,
  //                       maxLines: 1,
  //                       style: TextStyles.font14BlackColorW400,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             verticalSpace(12),
  //
  //             GestureDetector(
  //               onTap: () {
  //                 AppConstant.openUrl(AppConstant.instagram);
  //               },
  //               child: Row(
  //                 children: [
  //                   SvgPicture.asset(ImageAsset.instagramIcon),
  //                   horizontalSpace(8),
  //                   Expanded(
  //                     child: Text(
  //                       AppConstant.instagram,
  //                       maxLines: 1,
  //                       style: TextStyles.font14BlackColorW400,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             verticalSpace(12),
  //             GestureDetector(
  //               onTap: () {
  //                 AppConstant.openUrl(AppConstant.facebook);
  //               },
  //               child: Row(
  //                 children: [
  //                   SvgPicture.asset(ImageAsset.facebookIcon),
  //                   horizontalSpace(8),
  //                   Expanded(
  //                     child: Text(
  //                       AppConstant.facebook,
  //                       maxLines: 1,
  //                       style: TextStyles.font14BlackColorW400,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             verticalSpace(24),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
