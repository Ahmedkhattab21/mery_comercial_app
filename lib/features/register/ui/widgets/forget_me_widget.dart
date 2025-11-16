import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/register/logic/register_cubit.dart';
import 'package:mery_comercial_app/features/register/logic/register_state.dart';

class ForgetMeWidget extends StatelessWidget {
  const ForgetMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) {
        return current is OnChangeForgetMeState;
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            RegisterCubit.get(context).changeForgetMe();
          },
          child: Row(
            children: [
              Container(
                height: 16,
                width: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: RegisterCubit.get(context).isSelectForgetMe
                      ? AppColors.greenColor31
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors.greenColor31,
                  ),
                ),
                child: Icon(
                  Icons.done,
                  color: AppColors.whiteColor,
                  size: 12,
                ),
              ),
              horizontalSpace(12),
              Text(
                'تذكرنى',
                selectionColor: AppColors.greenColor31.withValues(
                  alpha: .2,
                ),
                style: TextStyles.font14greenColor31W500,
              ),
            ],
          ),
        );
      },
    );
  }
}
