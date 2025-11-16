import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_dashboard/config/routes/routes.dart';
import 'package:mery_dashboard/core/utils/app_colors_white_theme.dart';
import 'package:mery_dashboard/core/utils/app_constant.dart';
import 'package:mery_dashboard/core/utils/extentions.dart';
import 'package:mery_dashboard/core/utils/spacing.dart';
import 'package:mery_dashboard/core/utils/styles.dart';
import 'package:mery_dashboard/core/widgets/button_widget.dart';
import 'package:mery_dashboard/features/office/office_auth/office_forget_password/logic/forget_password_cubit.dart';
import 'package:mery_dashboard/features/office/office_auth/office_forget_password/logic/forget_password_state.dart';
import 'package:mery_dashboard/features/office/office_auth/office_forget_password/ui/widgets/email_widget.dart';

class OfficeForgetPasswordScreen extends StatelessWidget {
  const OfficeForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SelectionArea(
          child: Center(
            child: Container(
              height: 400,
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
                  key: OfficeForgetPasswordCubit.get(context).cubitKey,
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
                        'لوحة تحكم ادارة المكاتب',
                        selectionColor: AppColors.greenColor31.withValues(
                          alpha: .2,
                        ),
                        style: TextStyles.font16BlackColorBold,
                      ),
                      verticalSpace(24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'تغيير كلمة المرور',
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
                      BlocConsumer<
                        OfficeForgetPasswordCubit,
                        OfficeForgetPasswordState
                      >(
                        buildWhen: (previous, current) {
                          return current is OnForgetPasswordCatchErrorState ||
                              current is OnForgetPasswordSuccessState ||
                              current is OnForgetPasswordLoadingState ||
                              current is OnForgetPasswordErrorState;
                        },
                        listener: (context, state) {
                          if (state is OnForgetPasswordErrorState) {
                            AppConstant.toast(state.message, false, context);
                          } else if (state is OnForgetPasswordCatchErrorState) {
                            AppConstant.toast(state.message, false, context);
                          } else if (state is OnForgetPasswordSuccessState) {
                            AppConstant.toast(state.message, true, context);
                            context.pushNamed(
                              Routes.officeReseatPasswordScreen,
                              arguments: {
                                'email': OfficeForgetPasswordCubit.get(
                                  context,
                                ).emailController.text,
                              },
                            );
                          }
                        },
                        builder: (context, state) {
                          return ButtonWidget(
                            isLoading: state is OnForgetPasswordLoadingState,
                            buttonText: 'متابعة',
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
    if (OfficeForgetPasswordCubit.get(
      context,
    ).cubitKey.currentState!.validate()) {
      OfficeForgetPasswordCubit.get(context).forgetPassword();
    }
  }
}
