import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/core/services/services_locator.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/categories/data/models/categories_response_model.dart';
import 'package:mery_comercial_app/features/categories/logic/categories_cubit.dart';
import 'package:mery_comercial_app/features/categories/logic/categories_state.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoriesCubit(getIt())..getCategories(),
      child: const _CategoriesContent(),
    );
  }
}

class _CategoriesContent extends StatelessWidget {
  const _CategoriesContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      buildWhen: (previous, current) =>
          current is OnGetCategoriesLoadingState ||
          current is OnGetCategoriesSuccessState ||
          current is OnGetCategoriesErrorState ||
          current is OnGetCategoriesCatchErrorState,
      builder: (context, state) {
        if (state is OnGetCategoriesLoadingState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('خدمات سريعة', style: TextStyles.font18BlackColor13bold),
              verticalSpace(12),
              _buildShimmer(),
            ],
          );
        }

        final categories = CategoriesCubit.get(context).categories;

        if (categories.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('خدمات سريعة', style: TextStyles.font18BlackColor13bold),
            verticalSpace(12),
            SizedBox(
              height: 100.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                padding: EdgeInsets.only(left: 4.w),
                itemBuilder: (context, index) =>
                    _CategoryCard(category: categories[index]),
              ),
            ),
          ],
        );
      },
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
                  width: 60.r,
                  height: 60.r,
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

class _CategoryCard extends StatelessWidget {
  final Category category;

  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          category.imageUrl != null
              ? ClipOval(
                  child: Image.network(
                    category.imageUrl!,
                    width: 68.r,
                    height: 68.r,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _fallbackContainer(),
                  ),
                )
              : _fallbackContainer(),
          verticalSpace(8),
          SizedBox(
            width: 70.w,
            child: Text(
              category.name,
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
    );
  }

  Widget _fallbackContainer() {
    return Container(
      width: 68.r,
      height: 68.r,
      decoration: BoxDecoration(
        color: AppColors.greenColorEA,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.work_outline_rounded,
        size: 30.r,
        color: AppColors.greenColor31,
      ),
    );
  }
}
