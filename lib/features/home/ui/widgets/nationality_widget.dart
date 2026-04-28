import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/api/end_points.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/home/logic/home_cubit.dart';
import 'package:mery_comercial_app/features/home/logic/home_state.dart';
import 'package:shimmer/shimmer.dart';

class NationalityWidget extends StatelessWidget {
  const NationalityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('الجنسيات المتاحة', style: TextStyles.font18BlackColor13bold),
            GestureDetector(
              onTap: () => context.pushNamed(Routes.allCvsScreen),
              child: Text(
                'عرض الكل',
                style: TextStyles.font14greyColor64w500.copyWith(
                  color: AppColors.greenColor31,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(12),
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is OnGetNationalityLoadingState ||
              current is OnGetNationalityErrorState ||
              current is OnGetNationalitySuccessState ||
              current is OnGetNationalityCatchErrorState,
          builder: (context, state) {
            final nationalities = HomeCubit.get(context).nationalities;

            if (nationalities.isEmpty) {
              return _buildShimmer();
            }

            return SizedBox(
              height: 100.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nationalities.length,
                padding: EdgeInsets.only(left: 4.w),
                itemBuilder: (context, index) {
                  final item = nationalities[index];
                  return GestureDetector(
                    onTap: () => context.pushNamed(
                      Routes.allCvsScreen,
                      arguments: {'code': item.code},
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 62.r,
                            height: 62.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.network(
                                EndPoints.getImageFromApi(item.image),
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                  color: AppColors.greenColorEA,
                                  child: Icon(
                                    Icons.flag_outlined,
                                    size: 28.r,
                                    color: AppColors.greenColor31,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          verticalSpace(8),
                          SizedBox(
                            width: 70.w,
                            child: Text(
                              item.name,
                              style: TextStyles.font12blackColor13W400.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildShimmer() {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, __) => Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: [
                Container(
                  width: 62.r,
                  height: 62.r,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 50.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

