import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/home/logic/home_cubit.dart';
import 'package:mery_comercial_app/features/home/logic/home_state.dart';
import 'package:shimmer/shimmer.dart';
import 'package:share_plus/share_plus.dart';

class CvsWidget extends StatelessWidget {
  const CvsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header row: title + "عرض الكل" ────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('كل العمالة', style: TextStyles.font18BlackColor13bold),
            GestureDetector(
              onTap: () => context.pushNamed(
                Routes.allCvsScreen,
                arguments: {'code': ''},
              ),
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
        // ── Horizontal slider ───────────────────────────────────────
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is OnGetCVSLoadingState ||
              current is OnGetCVSErrorState ||
              current is OnGetCVSSuccessState ||
              current is OnGetCVSCatchErrorState,
          builder: (context, state) {
            final cvs = HomeCubit.get(context).cvs;
            final loading = state is OnGetCVSLoadingState;

            if (loading && cvs.isEmpty) {
              return SizedBox(
                height: 220.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  padding: EdgeInsets.only(left: 4.w),
                  itemBuilder: (_, __) => Padding(
                    padding: EdgeInsets.only(left: 14.w),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 160.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }

            if (cvs.isEmpty) {
              return SizedBox(
                height: 220.h,
                child: Center(
                  child: Text(
                    'لا توجد سير ذاتية',
                    style: TextStyles.font14greyColor64w500,
                  ),
                ),
              );
            }

            final displayed = cvs.take(6).toList();

            return SizedBox(
              height: 265.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: displayed.length,
                padding: EdgeInsets.only(left: 4.w),
                itemBuilder: (context, index) {
                  final item = displayed[index];
                  return Padding(
                    padding: EdgeInsets.only(left: 14.w),
                    child: GestureDetector(
                      onTap: () => context.pushNamed(
                        Routes.cvDetailsScreen,
                        arguments: {'id': item.id},
                      ),
                      child: Container(
                        width: 155.w,
                        height: 265.h,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.09),
                              blurRadius: 16,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ── PDF Banner (top half, visible from outside) ──
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18.r),
                                topRight: Radius.circular(18.r),
                              ),
                              child: Container(
                                height: 120.h,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff033B24),
                                      Color(0xff054F31),
                                      Color(0xff0A7A48),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    // Decorative arc circle top-right
                                    Positioned(
                                      top: -30,
                                      right: -30,
                                      child: Container(
                                        width: 90,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Colors.white.withOpacity(0.06),
                                        ),
                                      ),
                                    ),
                                    // Decorative arc bottom-left
                                    Positioned(
                                      bottom: -25,
                                      left: -20,
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Colors.white.withOpacity(0.06),
                                        ),
                                      ),
                                    ),
                                    // PDF file icon — large, centered
                                    Center(
                                      child: Container(
                                        width: 64.r,
                                        height: 64.r,
                                        decoration: BoxDecoration(
                                          color:
                                              Colors.white.withOpacity(0.14),
                                          borderRadius:
                                              BorderRadius.circular(14.r),
                                          border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.25),
                                            width: 1.5,
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: SvgPicture.asset(
                                          ImageAsset.pdfImage,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    // PDF red label bottom-left
                                    Positioned(
                                      bottom: 7,
                                      left: 8,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffD32F2F),
                                          borderRadius:
                                              BorderRadius.circular(6.r),
                                        ),
                                        child: Text(
                                          'PDF',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: 0.8,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Action buttons top-right
                                    Positioned(
                                      top: 6,
                                      right: 6,
                                      child: Column(
                                        children: [
                                          _MiniBtn(
                                            icon: Icons.share_rounded,
                                            onTap: () =>
                                                SharePlus.instance.share(
                                              ShareParams(
                                                text:
                                                    'https://mery.alemtayaz.com/cv/details/${item.id}',
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          _MiniBtn(
                                            icon:
                                                Icons.favorite_border_rounded,
                                            onTap: () =>
                                                HomeCubit.get(context)
                                                    .addToFavorite(
                                                        context, item.id),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // ── Info section ─────────────────────
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  9.w, 8.h, 9.w, 0),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    item.cvFile.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor13,
                                      height: 1.3,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  _InfoRow(
                                    icon: ImageAsset.countryIcon2,
                                    label: item.nationality.name,
                                  ),
                                  SizedBox(height: 3.h),
                                  _InfoRow(
                                    icon: ImageAsset.starAwardIcon,
                                    label: item.hasExperience
                                        ? 'لديها خبره'
                                        : 'لا خبرة',
                                    color: item.hasExperience
                                        ? AppColors.greenColor31
                                        : AppColors.greyColor8B,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            // ── Book button ──────────────────────
                            if (item.approvedBy < 3)
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    9.w, 6.h, 9.w, 9.h),
                                child: BlocBuilder<HomeCubit, HomeState>(
                                  buildWhen: (p, c) =>
                                      c is OnAddToBookingLoadingState ||
                                      c is OnAddToBookingSuccessState ||
                                      c is OnAddToBookingErrorState ||
                                      c is OnAddToBookingCatchErrorState,
                                  builder: (context, bState) {
                                    final isLoading =
                                        bState
                                                is OnAddToBookingLoadingState &&
                                            HomeCubit.get(context)
                                                    .bookingLoadingId ==
                                                item.id;
                                    return GestureDetector(
                                      onTap: isLoading
                                          ? null
                                          : () =>
                                              HomeCubit.get(context)
                                                  .addBooking(
                                                      context, item.id),
                                      child: Container(
                                        height: 32.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xff054F31),
                                              Color(0xff0C8A52),
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: isLoading
                                            ? const SizedBox(
                                                width: 16,
                                                height: 16,
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Text(
                                                'حجز العامله',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
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
}

// ── Helpers ───────────────────────────────────────────────────────────────

class _MiniBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _MiniBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.22),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
        ),
        child: Icon(icon, color: Colors.white, size: 13),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String icon;
  final String label;
  final Color? color;
  const _InfoRow({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: 12, width: 12),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: color ?? AppColors.greyColor8B,
            ),
          ),
        ),
      ],
    );
  }
}
