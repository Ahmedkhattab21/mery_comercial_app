import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/app_text_field.dart';
import 'package:mery_comercial_app/core/widgets/button_widget.dart';
import 'package:mery_comercial_app/features/edit_profile/logic/edit_profile_cubit.dart';
import 'package:mery_comercial_app/features/edit_profile/logic/edit_profile_state.dart';
import 'package:mery_comercial_app/features/edit_profile/ui/widgets/edit_name_widget.dart';
import 'package:mery_comercial_app/features/edit_profile/ui/widgets/edit_national_id_widget.dart';
import 'package:mery_comercial_app/features/edit_profile/ui/widgets/edit_phone_widget.dart';

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
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    selectionColor: AppColors.greenColor31.withValues(
                      alpha: .2,
                    ),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "الاسم ",
                          style: TextStyles.font14greenColor31W500,
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(8),
                EditNameWidget(),
                verticalSpace(24),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    selectionColor: AppColors.greenColor31.withValues(
                      alpha: .2,
                    ),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "رقم الهوية ",
                          style: TextStyles.font14greenColor31W500,
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(8),
                EditNationalIdWidget(),

                verticalSpace(24),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    selectionColor: AppColors.greenColor31.withValues(
                      alpha: .2,
                    ),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'رقم الجوال',
                          style: TextStyles.font14greenColor31W500,
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(8),
                EditPhoneWidget(),
                verticalSpace(40),
                BlocConsumer<EditProfileCubit, EditProfileState>(
                  buildWhen: (previous, current) {
                    return current is OnUpdateProfileLoadingState ||
                        current is OnUpdateProfileSuccessState ||
                        current is OnUpdateProfileErrorState ||
                        current is OnUpdateProfileCatchErrorState;
                  },
                  listener: (context, state) {
                    if (state is OnUpdateProfileSuccessState) {
                      AppConstant.toast(state.message, true, context);
                      context.pop();
                    } else if (state is OnUpdateProfileErrorState) {
                      AppConstant.toast(state.message, false, context);
                    } else if (state is OnUpdateProfileCatchErrorState) {
                      AppConstant.toast(state.message, false, context);
                    }
                  },
                  builder: (context, state) {
                    return ButtonWidget(
                      isLoading: state is OnUpdateProfileLoadingState,
                      buttonHeight: 44,
                      borderRadius: 8,
                      buttonText: 'تحديث',
                      backGroundColor: AppColors.greenColor31,
                      borderColor: AppColors.greenColor31,
                      textStyle: TextStyles.font16WhiteColorBold,
                      onPressed: () {
                        validateRegister(context);
                      },
                    );
                  },
                ),
                verticalSpace(24),

                GestureDetector(
                  onTap: () {
                    showLogOutBottomSheet(context, EditProfileCubit.get(context));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        size: 16.r,
                        color: AppColors.redColor26,
                      ),
                      horizontalSpace(14),
                      Text(
                        'حذف الحساب',
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
      ),
    );
  }

  void showLogOutBottomSheet(BuildContext context, EditProfileCubit cubit) {
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
                  'حذف الحساب',
                  style: TextStyles.font20BlackColor13Bold,
                ),
              ),
              verticalSpace(8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  'هل أنت متأكد أنك تريد حذف الحساب نهائيًا؟',
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
                  buttonText: 'حذف الحساب',
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

  void validateRegister(BuildContext context) {
    if (EditProfileCubit.get(context).loginKey.currentState!.validate()) {
      EditProfileCubit.get(context).updateProfile();
    }
  }
}
