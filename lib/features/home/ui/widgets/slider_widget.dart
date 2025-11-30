import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/home/logic/home_cubit.dart';
import 'package:mery_comercial_app/features/home/logic/home_state.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.blackColor13,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('جديد فى تطبيق ميرى', style: TextStyles.font16WhiteColorBold),
          verticalSpace(16),

          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) {
              return current is OnGetSliderLoadingState ||
                  current is OnGetSliderErrorState ||
                  current is OnGetSliderSuccessState ||
                  current is OnGetSliderCatchErrorState;
            },
            builder: (context, state) {
              if (HomeCubit.get(context).sliders.isEmpty) {
                return Container(
                  height: 120.h,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: AppColors.orangeColor48A.withValues(alpha: .4),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                );
              } else {
                return CarouselSlider(
                  items: HomeCubit.get(context).sliders
                      .map(
                        (item) => SizedBox(
                          height: 170,
                          width: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl: item.image ?? "",
                            fit: BoxFit.fill,
                            errorWidget: (context, error, stackTrace) {
                              return Container(
                                height: 120.h,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                decoration: BoxDecoration(
                                  color: AppColors.orangeColor48A.withValues(
                                    alpha: .4,
                                  ),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 170,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 400,
                    ),
                    autoPlayCurve: Curves.easeInSine,
                    pauseAutoPlayOnTouch: true,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    enlargeFactor: .1,
                    aspectRatio: 1,
                    viewportFraction: .99,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, _) {
                      HomeCubit.get(context).changeSelectedBanner(index);
                    },
                  ),
                );
              }
            },
          ),
          verticalSpace(16),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) {
              return current is OnGetSliderLoadingState ||
                  current is OnChangeSelectedBannerState ||
                  current is OnGetSliderErrorState ||
                  current is OnGetSliderSuccessState ||
                  current is OnGetSliderCatchErrorState;
            },
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: HomeCubit.get(context).sliders.asMap().entries.map((
                  item,
                ) {
                  if (item.key == HomeCubit.get(context).selectedBanner) {
                    return Container(
                      height: 14.r,
                      width: 14.r,
                      margin: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: AppColors.orangeColor48A,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        margin: EdgeInsets.all(1.r),
                        decoration: BoxDecoration(
                          color: AppColors.blackColor13,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(3.r),
                          decoration: BoxDecoration(
                            color: AppColors.orangeColor48A,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      height: 12.r,
                      width: 12.r,
                      margin: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: AppColors.greyColor64,
                        shape: BoxShape.circle,
                      ),
                    );
                  }
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
