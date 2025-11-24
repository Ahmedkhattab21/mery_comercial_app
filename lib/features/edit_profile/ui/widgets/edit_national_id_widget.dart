import 'package:flutter/material.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/app_text_field.dart';
import 'package:mery_comercial_app/features/edit_profile/logic/edit_profile_cubit.dart';

class EditNationalIdWidget extends StatelessWidget {
  const EditNationalIdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText:"رقم الهوية ",
      hintStyle: TextStyles.font14blackColor13W400.copyWith(
        color: AppColors.blackColor13.withValues(alpha: .4),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      isEnable: false,
      textStyle: TextStyles.font14blackColor13W400,
      controller: EditProfileCubit.get(context).nationalIDController,
      backgroundColor: AppColors.whiteColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.greenColor55, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.greenColor55, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.redColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.redColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "ادخل قيمة ";
        }
        return null;
      },
      keyboardType: TextInputType.phone,
    );
  }
}
