import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';

import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/booking/ui/widgets/book_widget.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: null,

        title: Text('طلباتي', style: TextStyles.font18WhiteColorW600),
        backgroundColor: AppColors.greenColor31,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [verticalSpace(16), BookWidget(), verticalSpace(40)],
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
