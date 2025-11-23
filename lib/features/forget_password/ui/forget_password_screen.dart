import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/button_widget.dart';
import 'package:mery_comercial_app/features/forget_password/logic/forget_password_cubit.dart';
import 'package:mery_comercial_app/features/forget_password/logic/forget_password_state.dart';
import 'package:mery_comercial_app/features/forget_password/ui/widgets/national_id_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.greenColor31,
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              context.pop();
            }
          },
          icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
        ),
        title: Text(
          'تطبيق ميرى للعمالة المنزلية',
          style: TextStyles.font18WhiteColorW600,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.greyColorE3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Form(
                key: ForgetPasswordCubit.get(context).cubitKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpace(30),
                    Text(
                      'تغيير كلمة المرور',
                      style: TextStyles.font24BlackColorBold,
                    ),
                    verticalSpace(24),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'رقم الهوية',
                              style: TextStyles.font14greenColor31W500,
                            ),
                            TextSpan(
                              text: '  *',
                              style: TextStyles.font14orangeColor09W500,
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(8),
                    NationalIdWidget(),
                    verticalSpace(24),

                    BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                      buildWhen: (previous, current) {
                        return current is OnForgetPasswordLoadingState ||
                            current is OnForgetPasswordSuccessState ||
                            current is OnForgetPasswordErrorState ||
                            current is OnForgetPasswordCatchErrorState;
                      },
                      listener: (context, state) {
                        if (state is OnForgetPasswordErrorState ||
                            state is OnForgetPasswordCatchErrorState) {
                          AppConstant.toast(
                            "رقم الهوية غير متواجد ",
                            false,
                            context,
                          );
                        } else if (state is OnForgetPasswordSuccessState) {
                          context.pushNamed(
                            Routes.forgetPassword2Screen,
                            arguments: {'token': state.message},
                          );
                        }
                      },
                      builder: (context, state) {
                        return ButtonWidget(
                          isLoading: state is OnForgetPasswordLoadingState,
                          buttonText: 'متابعة',
                          buttonHeight: 48,
                          borderRadius: 12,
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateRegister(BuildContext context) {
    if (ForgetPasswordCubit.get(context).cubitKey.currentState!.validate()) {
      ForgetPasswordCubit.get(context).forgetPassword();
    }
  }
}
