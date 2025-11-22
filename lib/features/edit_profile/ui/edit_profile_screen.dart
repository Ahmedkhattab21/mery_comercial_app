import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/edit_profile/logic/edit_profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
        ),
        title: Text('الملف الشخصي', style: TextStyles.font18WhiteColorW600),
        backgroundColor: AppColors.greenColor31,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Form(
            key: EditProfileCubit.get(context).loginKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),

                // verticalSpace(20),
                // Text("Full Name", style: TextStyles.font16blackColorW500),
                // verticalSpace(4),
                // AppTextFormField(
                //   hintText: "Full Name",
                //   hintStyle: TextStyles.font12blackColorW400,
                //   textStyle: TextStyles.font12blackColorW400,
                //   isEnable: isClient,
                //   controller: EditProfileCubit.get(context).nameController,
                //   contentPadding: EdgeInsets.symmetric(
                //     vertical: 12.h,
                //     horizontal: 20.w,
                //   ),
                //   backgroundColor: AppColors.whiteColor,
                //   enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(
                //       color: AppColors.greyColor44.withValues(alpha: .7),
                //       width: 1,
                //     ),
                //     borderRadius: BorderRadius.circular(24.r),
                //   ),
                //   focusedBorder: OutlineInputBorder(
                //     borderSide: BorderSide(
                //       color: AppColors.greyColor44.withValues(alpha: .7),
                //       width: 1,
                //     ),
                //     borderRadius: BorderRadius.circular(24.r),
                //   ),
                //   errorBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: AppColors.redColor, width: 1),
                //     borderRadius: BorderRadius.circular(24.r),
                //   ),
                //   focusedErrorBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: AppColors.redColor, width: 1),
                //     borderRadius: BorderRadius.circular(24.r),
                //   ),
                //   validator: (String? value) {},
                //   keyboardType: TextInputType.name,
                // ),
                // verticalSpace(16),
                // Text("Phone Number", style: TextStyles.font16blackColorW500),
                // verticalSpace(4),
                // BlocBuilder<EditProfileCubit, EditProfileState>(
                //   buildWhen: (previous, current) {
                //     return current is OnGetUSerDataLoadingState ||
                //         current is OnGetUSerDataErrorState ||
                //         current is OnGetUSerDataSuccessState ||
                //         current is OnGetUSerDataCatchErrorState;
                //   },
                //   builder: (context, state) {
                //     return AppTextFormField(
                //       hintText: "9999999999999",
                //       hintStyle: TextStyles.font12blackColorW400,
                //       textStyle: TextStyles.font12blackColorW400,
                //       controller: EditProfileCubit.get(context).phoneController,
                //       contentPadding: EdgeInsets.symmetric(
                //         vertical: 12.h,
                //         horizontal: 20.w,
                //       ),
                //       backgroundColor: AppColors.whiteColor,
                //       isEnable: isClient,
                //       prefixIcon: SizedBox(
                //         width: 120.w,
                //         child: CountryCodePicker(
                //           onChanged: (CountryCode code) {
                //             EditProfileCubit.get(
                //               context,
                //             ).countryCodeController.text = code
                //                 .toString();
                //           },
                //           initialSelection: EditProfileCubit.get(
                //             context,
                //           ).countryCodeController.text,
                //           favorite: [
                //             EditProfileCubit.get(
                //               context,
                //             ).countryCodeController.text,
                //           ],
                //           showCountryOnly: false,
                //           showOnlyCountryWhenClosed: false,
                //           alignLeft: true,
                //           textStyle: TextStyle(color: AppColors.whiteColor),
                //           flagDecoration: const BoxDecoration(
                //             shape: BoxShape.circle,
                //           ),
                //         ),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: AppColors.greyColor44.withValues(alpha: .7),
                //           width: 1,
                //         ),
                //         borderRadius: BorderRadius.circular(24.r),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: AppColors.greyColor44.withValues(alpha: .7),
                //           width: 1,
                //         ),
                //         borderRadius: BorderRadius.circular(24.r),
                //       ),
                //       errorBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: AppColors.redColor,
                //           width: 1,
                //         ),
                //         borderRadius: BorderRadius.circular(24.r),
                //       ),
                //       focusedErrorBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: AppColors.redColor,
                //           width: 1,
                //         ),
                //         borderRadius: BorderRadius.circular(24.r),
                //       ),
                //       validator: (String? value) {},
                //       keyboardType: TextInputType.phone,
                //     );
                //   },
                // ),
                //
                // verticalSpace(16),
                // Text("Email", style: TextStyles.font16blackColorW500),
                // verticalSpace(4),
                // AppTextFormField(
                //   hintText: "Email@email.com",
                //   hintStyle: TextStyles.font12blackColorW400,
                //   textStyle: TextStyles.font12blackColorW400,
                //   controller: EditProfileCubit.get(context).emailController,
                //   isEnable: isClient,
                //   contentPadding: EdgeInsets.symmetric(
                //     vertical: 12.h,
                //     horizontal: 20.w,
                //   ),
                //   backgroundColor: AppColors.whiteColor,
                //   enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(
                //       color: AppColors.greyColor44.withValues(alpha: .7),
                //       width: 1,
                //     ),
                //     borderRadius: BorderRadius.circular(24.r),
                //   ),
                //   focusedBorder: OutlineInputBorder(
                //     borderSide: BorderSide(
                //       color: AppColors.greyColor44.withValues(alpha: .7),
                //       width: 1,
                //     ),
                //     borderRadius: BorderRadius.circular(24.r),
                //   ),
                //   errorBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: AppColors.redColor, width: 1),
                //     borderRadius: BorderRadius.circular(24.r),
                //   ),
                //   focusedErrorBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: AppColors.redColor, width: 1),
                //     borderRadius: BorderRadius.circular(24.r),
                //   ),
                //   validator: (String? value) {},
                //   keyboardType: TextInputType.emailAddress,
                // ),
                //
                // if (isClient) verticalSpace(16),
                // if (isClient)
                //   Text("Job", style: TextStyles.font16blackColorW500),
                // if (isClient) verticalSpace(4),
                // if (isClient)
                //   AppTextFormField(
                //     hintText: "Job",
                //     hintStyle: TextStyles.font12blackColorW400,
                //     textStyle: TextStyles.font12blackColorW400,
                //     controller: EditProfileCubit.get(context).jobController,
                //     contentPadding: EdgeInsets.symmetric(
                //       vertical: 12.h,
                //       horizontal: 20.w,
                //     ),
                //     backgroundColor: AppColors.whiteColor,
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         color: AppColors.greyColor44.withValues(alpha: .7),
                //         width: 1,
                //       ),
                //       borderRadius: BorderRadius.circular(24.r),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         color: AppColors.greyColor44.withValues(alpha: .7),
                //         width: 1,
                //       ),
                //       borderRadius: BorderRadius.circular(24.r),
                //     ),
                //     errorBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         color: AppColors.redColor,
                //         width: 1,
                //       ),
                //       borderRadius: BorderRadius.circular(24.r),
                //     ),
                //     focusedErrorBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         color: AppColors.redColor,
                //         width: 1,
                //       ),
                //       borderRadius: BorderRadius.circular(24.r),
                //     ),
                //     validator: (String? value) {},
                //     keyboardType: TextInputType.text,
                //   ),
                // if (isClient) verticalSpace(16),
                // if (isClient)
                //   Text("Password", style: TextStyles.font16blackColorW500),
                // if (isClient) verticalSpace(4),
                // if (isClient)
                //   AppTextFormField(
                //     hintText: "Password",
                //     hintStyle: TextStyles.font12blackColorW400,
                //     textStyle: TextStyles.font12blackColorW400,
                //     controller: EditProfileCubit.get(
                //       context,
                //     ).passwordController,
                //     contentPadding: EdgeInsets.symmetric(
                //       vertical: 12.h,
                //       horizontal: 20.w,
                //     ),
                //     backgroundColor: AppColors.whiteColor,
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         color: AppColors.greyColor44.withValues(alpha: .7),
                //         width: 1,
                //       ),
                //       borderRadius: BorderRadius.circular(24.r),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         color: AppColors.greyColor44.withValues(alpha: .7),
                //         width: 1,
                //       ),
                //       borderRadius: BorderRadius.circular(24.r),
                //     ),
                //     errorBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         color: AppColors.redColor,
                //         width: 1,
                //       ),
                //       borderRadius: BorderRadius.circular(24.r),
                //     ),
                //     focusedErrorBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         color: AppColors.redColor,
                //         width: 1,
                //       ),
                //       borderRadius: BorderRadius.circular(24.r),
                //     ),
                //     validator: (String? value) {},
                //     keyboardType: TextInputType.visiblePassword,
                //   ),
                // if (isClient) verticalSpace(50),
                // if (isClient)
                //   BlocConsumer<EditProfileCubit, EditProfileState>(
                //     buildWhen: (previous, current) {
                //       return current is OnUpdateProfileLoadingState ||
                //           current is OnUpdateProfileSuccessState ||
                //           current is OnUpdateProfileErrorState ||
                //           current is OnUpdateProfileCatchErrorState;
                //     },
                //     listener: (context, state) {
                //       if (state is OnUpdateProfileSuccessState) {
                //         context.pop();
                //       }
                //     },
                //     builder: (context, state) {
                //       return ButtonWidget(
                //         isLoading: state is OnUpdateProfileLoadingState,
                //         borderRadius: 50,
                //         buttonHeight: 46.h,
                //         buttonText: "Save & Update",
                //         backGroundColor: AppColors.redColor,
                //         borderColor: AppColors.redColor,
                //         textStyle: TextStyles.font16whiteColorW600,
                //         onPressed: () {
                //           // context.pushNamed(Routes.forgetPasswordOtpScreen);
                //           validateRegister(context);
                //         },
                //       );
                //     },
                //   ),
                // verticalSpace(16),
                // if (isClient)
                //   Center(
                //     child: GestureDetector(
                //       onTap: () {
                //         showDeleteAccountBottomSheet(context,EditProfileCubit.get(context));
                //       },
                //       child: Text(
                //         'Delete Account',
                //         style: TextStyles.font18RedColorW600.copyWith(
                //           decoration: TextDecoration.underline,
                //           decorationColor: AppColors.whiteColor,
                //         ),
                //       ),
                //     ),
                //   ),
                verticalSpace(40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void showDeleteAccountBottomSheet(BuildContext context,EditProfileCubit cubit) {
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
  //             SvgPicture.asset(ImageAsset.deleteAccountIcon),
  //             verticalSpace(24),
  //             Text(
  //               'Delete My Account',
  //               style: TextStyles.font50BlackColorW500.copyWith(
  //                 color: AppColors.blackColor,
  //               ),
  //             ),
  //             verticalSpace(8),
  //             Text(
  //               "We're sad to see you go 😢  Deleting your account will permanently remove your profile and  bookings.",
  //               textAlign: TextAlign.center,
  //               style: TextStyles.font13blackColorW400,
  //             ),
  //             verticalSpace(16),
  //
  //             ButtonWidget(
  //               isLoading: false,
  //               borderRadius: 50,
  //               buttonHeight: 46.h,
  //               buttonText: "Never mind, Take Me Back",
  //               backGroundColor: AppColors.blackColor,
  //               borderColor: AppColors.blackColor,
  //               textStyle: TextStyles.font16whiteColorW600.copyWith(
  //                 color: AppColors.whiteColor,
  //               ),
  //               onPressed: () {
  //            context.pop();
  //               },
  //             ),
  //             verticalSpace(16),
  //             Center(
  //               child: GestureDetector(
  //                   onTap: () async {
  //                     cubit.logOut();
  //                     await CacheHelper.removeSecureData(
  //                       ConstantKeys.saveTokenToShared,
  //                     );
  //                     await CacheHelper.removeSecureData(
  //                       ConstantKeys.saveUserTypeToShared,
  //                     );
  //                     context.pushNamedAndRemoveUntil(
  //                       Routes.onBoardingScreen,
  //                       predicate: (predicate) => false,
  //                     );
  //                   },
  //                 child: Text(
  //                   'Delete My Account',
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

  void validateRegister(BuildContext context) {
    if (EditProfileCubit.get(context).loginKey.currentState!.validate()) {
      EditProfileCubit.get(context).updateProfile();
    }
  }
}
