import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/features/page_contain_content/logic/page_contain_content_cubit.dart';
import 'package:mery_comercial_app/features/page_contain_content/logic/page_contain_content_state.dart';

class PageContainContentScreen extends StatelessWidget {
  final String title;

  const PageContainContentScreen({required this.title, super.key});

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
        title: Text(
          title,
          style: TextStyles.font18WhiteColorW600,
        ),
        backgroundColor: AppColors.greenColor31,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(ImageAsset.authBackGroundImage),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                verticalSpace(20),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(32.r),
                        border: Border.all(
                            color: AppColors.greyColor44.withValues(alpha: .2))
                    ),
                    child: SingleChildScrollView(
                      child: BlocBuilder<PageContainContentCubit, PageContainContentState>(
                        // buildWhen: (previous,current) {
                        //   return current is
                        // },
                        builder: (context, state) {
                          return Text('AppConstant.terms');
                        },
                      ),
                    ),
                  ),
                ),

                verticalSpace(24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
