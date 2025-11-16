import 'package:flutter/material.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/app_text_field.dart';
import 'package:mery_comercial_app/features/register/logic/register_cubit.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: "الاسم",
      hintStyle: TextStyles.font14blackColor13W400.copyWith(
        color: AppColors.blackColor13.withValues(alpha: .4),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),

      textStyle: TextStyles.font14blackColor13W400,
      controller: RegisterCubit.get(context).nameController,
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
      keyboardType: TextInputType.text,
    );
  }
}
