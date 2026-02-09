import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/button_widget.dart';
import 'package:mery_comercial_app/features/register/logic/register_cubit.dart';
import 'package:mery_comercial_app/features/register/logic/register_state.dart';
import 'package:mery_comercial_app/features/register/ui/widgets/forget_me_widget.dart';
import 'package:mery_comercial_app/features/register/ui/widgets/name_widget.dart';
import 'package:mery_comercial_app/features/register/ui/widgets/password_widget.dart';
import 'package:mery_comercial_app/features/register/ui/widgets/phone_widget.dart';
import 'package:mery_comercial_app/features/register/ui/widgets/register_national_id_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.greyColorE3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Form(
                key: RegisterCubit.get(context).cubitKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpace(30),
                    Text(
                      'تسجيل حساب جديد',
                      style: TextStyles.font24BlackColorBold,
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
                              text: "الاسم ",
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
                    NameWidget(),
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
                            TextSpan(
                              text: '  *',
                              style: TextStyles.font14orangeColor09W500,
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(8),

                    RegisterNationalIdWidget(),


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
                            TextSpan(
                              text: '  *',
                              style: TextStyles.font14orangeColor09W500,
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(8),
                    PhoneWidget(),
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
                    BlocConsumer<RegisterCubit, RegisterState>(
                      buildWhen: (previous, current) {
                        return current is OnRegisterCatchErrorState ||
                            current is OnRegisterSuccessState ||
                            current is OnRegisterLoadingState ||
                            current is OnRegisterErrorState;
                      },
                      listener: (context, state) {
                        if (state is OnRegisterErrorState) {
                          AppConstant.toast(state.message, false, context);
                        } else if (state is OnRegisterCatchErrorState) {
                          AppConstant.toast(state.message, false, context);
                        } else if (state is OnRegisterSuccessState) {
                          AppConstant.toast(state.message, true, context);
                          context.pop();
                        }
                      },
                      builder: (context, state) {
                        return ButtonWidget(
                          isLoading: state is OnRegisterLoadingState,
                          buttonText: 'تسجيل الدخول',
                          buttonHeight: 44,
                          borderRadius: 8,
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
                        context.pop();
                      },
                      child: Text(
                        'لديك حساب ؟',
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
    if (RegisterCubit.get(context).cubitKey.currentState!.validate()) {
      RegisterCubit.get(context).register();
    }
  }
}
