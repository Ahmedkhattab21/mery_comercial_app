import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/button_widget.dart';
import 'package:mery_comercial_app/features/login/logic/login_cubit.dart';
import 'package:mery_comercial_app/features/login/logic/login_state.dart';
import 'package:mery_comercial_app/features/login/ui/widgets/email_widget.dart';
import 'package:mery_comercial_app/features/login/ui/widgets/forget_me_widget.dart';
import 'package:mery_comercial_app/features/login/ui/widgets/password_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SelectionArea(
          child: Center(
            child: Container(
              height: 550,
              width: 550,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.greyColorE3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: LoginCubit.get(context).loginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpace(30),
                      Text(
                        'نظام ميرى للعمالة المنزلية',
                        selectionColor: AppColors.greenColor31.withValues(
                          alpha: .2,
                        ),
                        style: TextStyles.font24BlackColorBold,
                      ),
                      verticalSpace(10),
                      Text(
                        'لوحة تحكم مدير النظام',
                        selectionColor: AppColors.greenColor31.withValues(
                          alpha: .2,
                        ),
                        style: TextStyles.font16BlackColorBold,
                      ),
                      verticalSpace(24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'تسجيل الدخول',
                          selectionColor: AppColors.greenColor31.withValues(
                            alpha: .2,
                          ),
                          style: TextStyles.font16BlackColorBold,
                        ),
                      ),

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
                                text: 'عنوان البريد الالكترونى',
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
                      EmailWidget(),
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
                            // context.pushNamedAndRemoveUntil(
                            //   Routes.sideBarScreen,
                            //   predicate: (predicate) => false,
                            // );
                          }
                        },
                        builder: (context, state) {
                          return ButtonWidget(
                            isLoading: state is OnLoginLoadingState,
                            buttonText: 'تسجيل الدخول',
                            buttonHeight: 44,
                            borderRadius: 8,
                            backGroundColor: AppColors.greenColor31,
                            borderColor: AppColors.greenColor31,
                            textStyle: TextStyles.font16whiteColorBold,
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
      ),
    );
  }

  void validateRegister(BuildContext context) {
    if (LoginCubit.get(context).loginKey.currentState!.validate()) {
      LoginCubit.get(context).login();
    }
  }
}
