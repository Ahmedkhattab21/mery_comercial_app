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
import 'package:mery_comercial_app/features/login/logic/login_cubit.dart';
import 'package:mery_comercial_app/features/login/logic/login_state.dart';
import 'package:mery_comercial_app/features/login/ui/widgets/national_id_widget.dart';
import 'package:mery_comercial_app/features/login/ui/widgets/forget_me_widget.dart';
import 'package:mery_comercial_app/features/login/ui/widgets/password_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                key: LoginCubit.get(context).loginKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpace(30),
                    Text(
                      'تسجيل الدخول',
                      style: TextStyles.font24BlackColorBold,
                    ),
                    verticalSpace(24),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'رقم الهوية ',
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'كلمة المرور ',
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
                    PasswordWidget(),

                    verticalSpace(8),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          context.pushNamed(
                          Routes.forgetPasswordScreen,
                          );
                        },
                        child: Text(
                          'نسيت كلمة المرور ؟',
                          selectionColor: AppColors.greenColor31.withValues(
                            alpha: .2,
                          ),
                          style: TextStyles.font14greenColor31Bold.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.greenColor31,
                          ),
                        ),
                      ),
                    ),

                    verticalSpace(24),

                    ForgetMeWidget(),
                    verticalSpace(24),
                    BlocConsumer<LoginCubit, LoginState>(
                      buildWhen: (previous, current) {
                        return current is OnLoginCatchErrorState ||
                            current is OnLoginSuccessState ||
                            current is OnLoginLoadingState ||
                            current is OnLoginErrorState;
                      },
                      listener: (context, state) {
                        if (state is OnLoginErrorState ||
                            state is OnLoginCatchErrorState) {
                          AppConstant.toast(
                            "حدث خطأ أثناء تسجيل الدخول",
                            false,
                            context,
                          );
                        } else if (state is OnLoginSuccessState) {
                          AppConstant.toast(
                            "تم تسجيل الدخول بنجاح",
                            true,
                            context,
                          );
                          context.pushNamedAndRemoveUntil(
                            Routes.buttonNavigationBarScreen,
                            predicate: (predicate) => false,
                          );
                        }
                      },
                      builder: (context, state) {
                        return ButtonWidget(
                          isLoading: state is OnLoginLoadingState,
                          buttonText: 'تسجيل الدخول',
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
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.registerScreen);
                      },
                      child: Text(
                        'ليس لديك حساب ؟',
                        selectionColor: AppColors.greenColor31.withValues(
                          alpha: .2,
                        ),
                        style: TextStyles.font14greenColor31Bold.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.greenColor31,
                        ),
                      ),
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
    if (LoginCubit.get(context).loginKey.currentState!.validate()) {
      LoginCubit.get(context).login();
    }
  }
}
