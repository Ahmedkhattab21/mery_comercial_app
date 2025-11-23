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
import 'package:mery_comercial_app/features/forget_password_2/logic/forget_password_2_cubit.dart';
import 'package:mery_comercial_app/features/forget_password_2/logic/forget_password_2_state.dart';
 import 'package:mery_comercial_app/features/forget_password_2/ui/widgets/forget_phone_widget.dart';

class ForgetPassword2Screen extends StatelessWidget {
  final String token;
  const ForgetPassword2Screen({required this.token ,super.key});

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
                key: ForgetPassword2Cubit.get(context).cubitKey,
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
                              text: 'رقم الجوال',
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
                    ForgetPhoneWidget(),
                    verticalSpace(24),


                    BlocConsumer<ForgetPassword2Cubit, ForgetPassword2State>(
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
                            "رقم الجوال غير صحيح ",
                            false,
                            context,
                          );
                        } else if (state is OnForgetPasswordSuccessState) {

                          context.pushNamed(
                            Routes.resetPasswordScreen,
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
    if (ForgetPassword2Cubit.get(
      context,
    ).cubitKey.currentState!.validate()) {
      ForgetPassword2Cubit.get(context).forgetPassword(token);
    }
  }
}
