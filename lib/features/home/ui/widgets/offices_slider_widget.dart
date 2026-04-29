import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/services/services_locator.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/empty_state_widget.dart';
import 'package:mery_comercial_app/features/offices/data/models/offices_response_model.dart';
import 'package:mery_comercial_app/features/offices/logic/offices_cubit.dart';
import 'package:mery_comercial_app/features/offices/logic/offices_state.dart';
import 'package:shimmer/shimmer.dart';

class OfficesSliderWidget extends StatelessWidget {
  const OfficesSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OfficesCubit(getIt())..getOffices(),
      child: const _OfficesSliderContent(),
    );
  }
}

class _OfficesSliderContent extends StatelessWidget {
  const _OfficesSliderContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('المكاتب', style: TextStyles.font18BlackColor13bold),
            GestureDetector(
              onTap: () => context.pushNamed(Routes.officesScreen),
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
        BlocBuilder<OfficesCubit, OfficesState>(
          buildWhen: (previous, current) =>
              current is OnGetOfficesLoadingState ||
              current is OnGetOfficesSuccessState ||
              current is OnGetOfficesErrorState ||
              current is OnGetOfficesCatchErrorState,
          builder: (context, state) {
            if (state is OnGetOfficesLoadingState) {
              return SizedBox(
                height: 190.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, __) => Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 150.w,
                        height: 190.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }

            final offices = OfficesCubit.get(context).offices;

            if (offices.isEmpty) {
              return SizedBox(
                height: 190.h,
                child: EmptyStateWidget(
                  svgAsset: ImageAsset.officeIcon,
                  title: 'لا توجد مكاتب',
                ),
              );
            }

            return SizedBox(
              height: 190.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offices.length,
                padding: EdgeInsets.only(left: 4.w),
                itemBuilder: (context, index) =>
                    _OfficeSliderCard(office: offices[index]),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _OfficeSliderCard extends StatelessWidget {
  final Office office;

  const _OfficeSliderCard({required this.office});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.officeDetailsScreen,
        arguments: {'id': office.id},
      ),
      child: Container(
        width: 150.w,
        margin: EdgeInsets.only(left: 12.w),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: AppColors.greyColorEE),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular logo with green ring
            Container(
              width: 64.r,
              height: 64.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.greenColor31, width: 2),
              ),
              child: ClipOval(
                child: office.imageUrl != null
                    ? Image.network(
                        office.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppColors.greenColorEA,
                          child: Icon(Icons.business,
                              size: 30.r, color: AppColors.greenColor31),
                        ),
                      )
                    : Container(
                        color: AppColors.greenColorEA,
                        child: Icon(Icons.business,
                            size: 30.r, color: AppColors.greenColor31),
                      ),
              ),
            ),
            verticalSpace(8),
            // Star rating row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star_rounded, size: 14.r, color: const Color(0xFFFFC107)),
                horizontalSpace(3),
                Text(
                  '4.8',
                  style: TextStyles.font12blackColor13W400.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
            verticalSpace(6),
            // Office name
            Text(
              office.name,
              style: TextStyles.font12blackColor13W400.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(8),
            // "عرض المكتب" button
            Container(
              width: double.infinity,
              height: 28.h,
              decoration: BoxDecoration(
                color: AppColors.greenColor31,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Text(
                  'عرض المكتب',
                  style: TextStyles.font12WhiteColorW400.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
