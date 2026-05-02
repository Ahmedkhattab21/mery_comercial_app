import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/widgets/empty_state_widget.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/button_widget.dart';
import 'package:mery_comercial_app/features/all_cvs/logic/all_cvs_cubit.dart';
import 'package:mery_comercial_app/features/all_cvs/logic/all_cvs_state.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class AllCvsWidget extends StatelessWidget {
  const AllCvsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCvsCubit, AllCvsState>(
      buildWhen: (previous, current) {
        return current is OnGetNationalityCvsLoadingState ||
            current is OnGetNationalityCvsErrorState ||
            current is OnGetNationalityCvsSuccessState ||
            current is OnGetNationalityCvsCatchErrorState;
      },
      builder: (context, state) {
        if (state is OnGetNationalityCvsLoadingState &&
            AllCvsCubit.get(context).nationalityCvs.isEmpty) {
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
              ),
            ),
          );
        } else {
          if (AllCvsCubit.get(context).nationalityCvs.isEmpty) {
            return EmptyStateWidget(
              svgAsset: ImageAsset.profileIcon,
              title: 'لا توجد سير ذاتية',
              subtitle: 'لا تتوفر نتائج لهذا البحث',
              expanded: false,
            );
          } else {
            return ListView.builder(
                padding: EdgeInsets.only(bottom: 24.h),
                itemCount: AllCvsCubit.get(context).nationalityCvs.length,
                itemBuilder: (context, index) {
                  final item =
                      AllCvsCubit.get(context).nationalityCvs[index];
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        Routes.cvDetailsScreen,
                        arguments: {'id': item.id},
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 14.h),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(18.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.07),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ── PDF Preview Banner ──────────────────────────
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18.r),
                              topRight: Radius.circular(18.r),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 110.h,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xff054F31),
                                    const Color(0xff0A7A4A),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  // decorative circles
                                  Positioned(
                                    top: -20,
                                    left: -20,
                                    child: Container(
                                      width: 90,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(0.06),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -30,
                                    right: -10,
                                    child: Container(
                                      width: 110,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(0.06),
                                      ),
                                    ),
                                  ),
                                  // PDF icon centred
                                  Center(
                                    child: Container(
                                      height: 68.h,
                                      width: 68.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.15),
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                        border: Border.all(
                                          color:
                                              Colors.white.withOpacity(0.30),
                                          width: 1.5,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: SvgPicture.asset(
                                        ImageAsset.pdfImage,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  // action buttons top-right
                                  Positioned(
                                    top: 6,
                                    right: 4,
                                    child: Row(
                                      children: [
                                        _ActionButton(
                                          icon: Icons.share_rounded,
                                          onTap: () {
                                            SharePlus.instance.share(
                                              ShareParams(
                                                text:
                                                    'https://mery.alemtayaz.com/cv/details/${item.id}',
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(width: 4),
                                        _ActionButton(
                                          icon: Icons.favorite_border_rounded,
                                          onTap: () {
                                            AllCvsCubit.get(context)
                                                .addToFavorite(
                                                    context, item.id);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  // PDF label bottom-left
                                  Positioned(
                                    bottom: 8,
                                    left: 12,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffE53935)
                                            .withOpacity(0.85),
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                      ),
                                      child: Text(
                                        'PDF',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // ── Body ────────────────────────────────────────
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 14.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // File name
                                Text(
                                  item.cvFile.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font14BlackColorBold,
                                ),
                                verticalSpace(12),

                                // Info chips row
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    _InfoChip(
                                      icon: ImageAsset.countryIcon2,
                                      label: item.nationality.name,
                                    ),
                                    _InfoChip(
                                      icon: ImageAsset.starAwardIcon,
                                      label: item.hasExperience
                                          ? 'لديها خبره'
                                          : 'ليس لديها خبره',
                                      color: item.hasExperience
                                          ? AppColors.greenColorF3
                                          : AppColors.greyColorF7,
                                      textColor: item.hasExperience
                                          ? AppColors.greenColor31
                                          : AppColors.greyColor8B,
                                    ),
                                    _InfoChip(
                                      icon: ImageAsset.ramadhanIcon,
                                      label: item.isMuslim
                                          ? 'مسلمة'
                                          : 'غير مسلمة',
                                      color: item.isMuslim
                                          ? AppColors.greenColorF3
                                          : AppColors.greyColorF7,
                                      textColor: item.isMuslim
                                          ? AppColors.greenColor31
                                          : AppColors.greyColor8B,
                                    ),
                                  ],
                                ),

                                if (item.approvedBy < 3) ...[
                                  verticalSpace(14),
                                  BlocBuilder<AllCvsCubit, AllCvsState>(
                                    buildWhen: (previous, current) {
                                      return current
                                              is OnAddToBookingLoadingState ||
                                          current
                                              is OnAddToBookingSuccessState ||
                                          current
                                              is OnAddToBookingErrorState ||
                                          current
                                              is OnAddToBookingCatchErrorState;
                                    },
                                    builder: (context, state) {
                                      return ButtonWidget(
                                        isLoading: state
                                                is OnAddToBookingLoadingState &&
                                            AllCvsCubit.get(context)
                                                    .bookingLoadingId ==
                                                item.id,
                                        buttonHeight: 44,
                                        buttonText: 'حجز العامله',
                                        borderRadius: 10,
                                        backGroundColor: AppColors.greenColor31,
                                        borderColor: AppColors.greenColor31,
                                        textStyle:
                                            TextStyles.font16WhiteColorBold,
                                        onPressed: () {
                                          AllCvsCubit.get(context)
                                              .addBooking(context, item.id);
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
          }
        }
      },
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ActionButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.18),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String icon;
  final String label;
  final Color? color;
  final Color? textColor;

  const _InfoChip({
    required this.icon,
    required this.label,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: color ?? AppColors.greyColorF7,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon, height: 14, width: 14),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: textColor ?? AppColors.greyColor8B,
            ),
          ),
        ],
      ),
    );
  }
}
