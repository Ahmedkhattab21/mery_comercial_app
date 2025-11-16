import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/app_text_field.dart';
import 'package:mery_comercial_app/features/register/logic/register_cubit.dart';
import 'package:mery_comercial_app/features/register/logic/register_state.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) {
        return current is IsPasswordVisibleState;
      },
      builder: (context, state) {
        return AppTextFormField(
          hintText: "",
          hintStyle: TextStyles.font14blackColor13W400.copyWith(
            color: AppColors.blackColor13.withValues(alpha: .6),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          isObscureText: RegisterCubit.get(context).isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              RegisterCubit.get(context).isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: AppColors.greenColor31,
            ),
            onPressed: () {
              RegisterCubit.get(context).changePasswordState();
            },
          ),
          textStyle: TextStyles.font14blackColor13W400,
          controller: RegisterCubit.get(context).passwordController,
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
          keyboardType: TextInputType.visiblePassword,
        );
      },
    );
  }
}
