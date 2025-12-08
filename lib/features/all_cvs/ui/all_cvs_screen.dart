import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';

import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/app_drop_down_field.dart';
import 'package:mery_comercial_app/features/all_cvs/logic/all_cvs_cubit.dart';
import 'package:mery_comercial_app/features/all_cvs/ui/widgets/all_cvs_widget.dart';

class AllCvsScreen extends StatelessWidget {
  final String code;
  const AllCvsScreen({required this.code, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
        ),

        title: Text('السير الذاتية', style: TextStyles.font18WhiteColorW600),
        backgroundColor: AppColors.greenColor31,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpace(16),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'الديانة',
                          selectionColor: AppColors.greenColor31.withValues(
                            alpha: .2,
                          ),
                          style: TextStyles.font14greenColor31W500,
                        ),
                        verticalSpace(8),
                        AppDropDownField(
                          hintText: "كل الديانات",
                          items: AppConstant.muslimsList,
                          onChanged: (value) {
                            AllCvsCubit.get(context).changeISMuslims(
                              code,
                              value.id == 1 ? true : false,
                            );
                          },
                          hintStyle: TextStyles.font14greyColor64w500,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 20,
                          ),
                          textStyle: TextStyles.font14greyColor64w500,
                          backgroundColor: AppColors.whiteColor,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.greenColor31,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.greenColor31,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(24),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'الخبره',
                          selectionColor: AppColors.greenColor31.withValues(
                            alpha: .2,
                          ),
                          style: TextStyles.font14greenColor31W500,
                        ),
                        verticalSpace(8),
                        AppDropDownField(
                          hintText: "كل الحالات",
                          items: AppConstant.experienceList,
                          onChanged: (value) {
                            AllCvsCubit.get(context).changeISExperience(
                              code,
                              value.id == 1 ? true : false,
                            );
                          },
                          hintStyle: TextStyles.font14greyColor64w500,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 20,
                          ),
                          textStyle: TextStyles.font14greyColor64w500,
                          backgroundColor: AppColors.whiteColor,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.greenColor31,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.greenColor31,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Expanded(child: AllCvsWidget()),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }
}
