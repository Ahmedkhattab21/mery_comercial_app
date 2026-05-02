import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/page_contain_content/logic/page_contain_content_cubit.dart';
import 'package:mery_comercial_app/features/page_contain_content/logic/page_contain_content_state.dart';
import 'package:shimmer/shimmer.dart';

class PageContainContentScreen extends StatelessWidget {
  final String title;

  const PageContainContentScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColorF7,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            margin: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back, color: Colors.white, size: 20.r),
          ),
        ),
        title: Text(title, style: TextStyles.font18WhiteColorW600),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ── Green gradient header ──────────────────────────────────
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 56.h + 24.h,
              bottom: 32.h,
              left: 24.w,
              right: 24.w,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.greenColor31,
                  AppColors.greenColor31.withOpacity(0.82),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36.r),
                bottomRight: Radius.circular(36.r),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 64.r,
                  height: 64.r,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.35),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.policy_outlined,
                    color: Colors.white,
                    size: 32.r,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  title,
                  style: TextStyles.font18WhiteColorW600.copyWith(
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 6.h),
                Container(
                  height: 3.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ],
            ),
          ),

          // ── Content ───────────────────────────────────────────────
          Expanded(
            child: BlocBuilder<PageContainContentCubit, PageContainContentState>(
              buildWhen: (previous, current) =>
                  current is OnGetPagesLoadingState ||
                  current is OnGetPagesSuccessState ||
                  current is OnGetPagesErrorState ||
                  current is OnGetPagesCatchErrorState,
              builder: (context, state) {
                if (state is OnGetPagesLoadingState) {
                  return _buildShimmer();
                }

                if (state is OnGetPagesErrorState ||
                    state is OnGetPagesCatchErrorState) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.error_outline,
                            size: 52.r, color: AppColors.greyColorAC),
                        SizedBox(height: 12.h),
                        Text(
                          'تعذر تحميل المحتوى',
                          style: TextStyles.font16blackColor13W500.copyWith(
                            color: AppColors.greyColorAC,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                final text =
                    PageContainContentCubit.get(context).metaDescription;

                return SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 14.5.sp,
                        height: 2.0,
                        color: const Color(0xFF2D2D2D),
                        fontFamily: 'Cairo',
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: double.infinity,
          height: 400.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}
