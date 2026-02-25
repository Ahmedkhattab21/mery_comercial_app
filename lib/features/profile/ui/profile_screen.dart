import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/button_widget.dart';
import 'package:mery_comercial_app/features/profile/logic/profile_cubit.dart';
import 'package:mery_comercial_app/my_app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: Text("البروفايل", style: TextStyles.font18WhiteColorW600),
        backgroundColor: AppColors.greenColor31,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(80),
              Center(
                child: Container(
                  height: 100.r,
                  width: 100.r,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(ImageAsset.meryIcon, fit: BoxFit.cover),
                ),
              ),
              verticalSpace(50),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.editProfileScreen);
                },
                child: Row(
                  children: [
                    Container(
                      height: 35.r,
                      width: 35.r,
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            AppColors.greenColor31,
                            AppColors.greenColor31,
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        color: AppColors.whiteColor,
                        size: 15.r,
                      ),
                    ),
                    horizontalSpace(16),
                    Expanded(
                      child: Text(
                        'الملف الشخصي',
                        style: TextStyles.font14blackColor13w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.r,
                      color: AppColors.greenColor31,
                    ),
                  ],
                ),
              ),
              verticalSpace(8),
              Divider(color: AppColors.greyColor.withValues(alpha: .6)),
              verticalSpace(8),
              GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.pageContainContentScreen,
                    arguments: {'title': 'سياسة الاستخدام','id':11},
                  );
                },
                child: Row(
                  children: [
                    Container(
                      height: 35.r,
                      width: 35.r,
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            AppColors.greenColor31,
                            AppColors.greenColor31,
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.privacy_tip,
                        color: AppColors.whiteColor,
                        size: 15.r,
                      ),
                    ),
                    horizontalSpace(16),
                    Expanded(
                      child: Text(
                        'سياسة الاستخدام',
                        style: TextStyles.font14blackColor13w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.r,
                      color: AppColors.greenColor31,
                    ),
                  ],
                ),
              ),
              verticalSpace(8),
              Divider(color: AppColors.greyColor.withValues(alpha: .6)),
              verticalSpace(8),
              GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.pageContainContentScreen,
                    arguments: {'title': 'شروط الخصوصية','id':12},
                  );
                },
                child: Row(
                  children: [
                    Container(
                      height: 35.r,
                      width: 35.r,
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            AppColors.greenColor31,
                            AppColors.greenColor31,
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.lock,
                        color: AppColors.whiteColor,
                        size: 15.r,
                      ),
                    ),
                    horizontalSpace(16),
                    Expanded(
                      child: Text(
                        'شروط الخصوصية',
                        style: TextStyles.font14blackColor13w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.r,
                      color: AppColors.greenColor31,
                    ),
                  ],
                ),
              ),
              verticalSpace(8),
              Divider(color: AppColors.greyColor.withValues(alpha: .6)),
              verticalSpace(8),
              GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.pageContainContentScreen,
                    arguments: {'title': 'من نحن','id':10},
                  );
                },
                child: Row(
                  children: [
                    Container(
                      height: 35.r,
                      width: 35.r,
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            AppColors.greenColor31,
                            AppColors.greenColor31,
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.info,
                        color: AppColors.whiteColor,
                        size: 15.r,
                      ),
                    ),
                    horizontalSpace(16),
                    Expanded(
                      child: Text(
                        'من نحن',
                        style: TextStyles.font14blackColor13w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.r,
                      color: AppColors.greenColor31,
                    ),
                  ],
                ),
              ),
              verticalSpace(8),
              Divider(color: AppColors.greyColor.withValues(alpha: .6)),
              verticalSpace(8),
              GestureDetector(
                onTap: () {
                  // context.pushNamed(
                  //   Routes.pageContainContentScreen,
                  //   arguments: {'title': 'من نحن'},
                  // );
                },
                child: Row(
                  children: [
                    Container(
                      height: 35.r,
                      width: 35.r,
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            AppColors.greenColor31,
                            AppColors.greenColor31,
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.headset_mic,
                        color: AppColors.whiteColor,
                        size: 15.r,
                      ),
                    ),
                    horizontalSpace(16),
                    Expanded(
                      child: Text(
                        'الدعم الفني',
                        style: TextStyles.font14blackColor13w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.r,
                      color: AppColors.greenColor31,
                    ),
                  ],
                ),
              ),
              verticalSpace(8),
              Divider(color: AppColors.greyColor.withValues(alpha: .6)),
              verticalSpace(24),

              GestureDetector(
                onTap: () {
                  showLogOutBottomSheet(context, ProfileCubit.get(context));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, size: 16.r, color: AppColors.redColor26),
                    horizontalSpace(14),
                    Text(
                      'تسجيل الخروج',
                      style: TextStyles.font16bredColor26Bold,
                    ),
                    horizontalSpace(24),
                  ],
                ),
              ),

              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }

  void showLogOutBottomSheet(BuildContext context, ProfileCubit cubit) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Make bottom sheet fit content
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 4.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
              verticalSpace(24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.greenColor31,
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, color: AppColors.greenColor31),
                    ),
                  ),
                ],
              ),
              verticalSpace(12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  'تسجيل الخروج',
                  style: TextStyles.font20BlackColor13Bold,
                ),
              ),
              verticalSpace(8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  'هل أنت متأكد من أنك تريد تسجيل الخروج؟',
                  style: TextStyles.font14greyColor64w400,
                ),
              ),
              verticalSpace(24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: ButtonWidget(
                  isLoading: false,
                  borderRadius: 12,
                  buttonHeight: 46.h,
                  buttonText: 'تسجيل الخروج',
                  backGroundColor: AppColors.redColor,
                  borderColor: AppColors.redColor,
                  textStyle: TextStyles.font16WhiteColorBold,
                  onPressed: () async {
                    cubit.logOut();
                    await CacheHelper.removeSecureData(
                      ConstantKeys.saveTokenToShared,
                    );
                    await CacheHelper.removeSecureData(
                      ConstantKeys.saveNAmeToShared,
                    );
                    context.pushNamedAndRemoveUntil(
                      Routes.loginScreen,
                      predicate: (predicate) => false,
                    );
                  },
                ),
              ),
              verticalSpace(24),
            ],
          ),
        );
      },
    );
  }

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

