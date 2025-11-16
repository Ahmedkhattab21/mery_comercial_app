import 'package:flutter/material.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/app_text_field.dart';
 import 'package:mery_comercial_app/features/login/logic/login_cubit.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: "mery@gmail.com",
      hintStyle: TextStyles.font14blackColor13W400.copyWith(
        color: AppColors.blackColor13.withValues(alpha: .4),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),

      textStyle: TextStyles.font14blackColor13W400,
      controller: LoginCubit.get(context).emailController,
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
      keyboardType: TextInputType.emailAddress,
    );
  }
}
