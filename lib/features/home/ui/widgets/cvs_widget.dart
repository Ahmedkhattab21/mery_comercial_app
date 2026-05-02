import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/widgets/empty_state_widget.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/button_widget.dart';
import 'package:mery_comercial_app/features/home/logic/home_cubit.dart';
import 'package:mery_comercial_app/features/home/logic/home_state.dart';
import 'package:shimmer/shimmer.dart';
import 'package:share_plus/share_plus.dart';

class CvsWidget extends StatefulWidget {
  const CvsWidget({super.key});

  @override
  State<CvsWidget> createState() => _CvsWidgetState();
}

class _CvsWidgetState extends State<CvsWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.88);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is OnGetCVSLoadingState ||
            current is OnGetCVSErrorState ||
            current is OnGetCVSSuccessState ||
            current is OnGetCVSCatchErrorState;
      },
      builder: (context, state) {
        if (state is OnGetCVSLoadingState &&
            HomeCubit.get(context).cvs.isEmpty) {
          return SizedBox(
            height: 340.h,
            child: PageView.builder(
              itemCount: 3,
              controller: PageController(viewportFraction: 0.88),
              itemBuilder: (_, __) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (HomeCubit.get(context).cvs.isEmpty) {
          return EmptyStateWidget(
            svgAsset: ImageAsset.profileIcon,
            title: 'لا توجد سير ذاتية',
            subtitle: 'لا تتوفر سير ذاتية حالياً',
          );
        } else {
          final cvs = HomeCubit.get(context).cvs;
          return Column(
            children: [
              SizedBox(
                height: 360.h,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: cvs.length,
                  onPageChanged: (i) => setState(() => _currentPage = i),
                  itemBuilder: (context, index) {
                    final item = cvs[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: GestureDetector(
                        onTap: () => context.pushNamed(
                          Routes.cvDetailsScreen,
                          arguments: {'id': item.id},
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(18.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.09),
                                blurRadius: 20,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ── Green PDF Banner ─────────────────
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18.r),
                                  topRight: Radius.circular(18.r),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 140.h,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff054F31),
                                        Color(0xff0A7A4A),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: -25,
                                        left: -25,
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.white.withOpacity(0.06),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -35,
                                        right: -15,
                                        child: Container(
                                          width: 130,
                                          height: 130,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.white.withOpacity(0.06),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          height: 76.h,
                                          width: 76.w,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.15),
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            border: Border.all(
                                              color:
                                                  Colors.white.withOpacity(0.3),
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
                                      // action buttons
                                      Positioned(
                                        top: 8,
                                        right: 6,
                                        child: Row(
                                          children: [
                                            _ActionBtn(
                                              icon: Icons.share_rounded,
                                              onTap: () =>
                                                  SharePlus.instance.share(
                                                ShareParams(
                                                  text:
                                                      'https://mery.alemtayaz.com/cv/details/${item.id}',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            _ActionBtn(
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
                                      // PDF badge
                                      Positioned(
                                        bottom: 10,
                                        left: 14,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: const Color(0xffE53935)
                                                .withOpacity(0.88),
                                            borderRadius:
                                                BorderRadius.circular(6.r),
                                          ),
                                          child: Text(
                                            'PDF',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.6,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // page counter badge
                                      Positioned(
                                        bottom: 10,
                                        right: 14,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                          child: Text(
                                            '${index + 1} / ${cvs.length}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // ── Body ─────────────────────────────
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 12.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.cvFile.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyles.font14BlackColorBold,
                                      ),
                                      verticalSpace(10),
                                      Wrap(
                                        spacing: 6,
                                        runSpacing: 6,
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
                                      const Spacer(),
                                      if (item.approvedBy < 3)
                                        BlocBuilder<HomeCubit, HomeState>(
                                          buildWhen: (p, c) =>
                                              c is OnAddToBookingLoadingState ||
                                              c is OnAddToBookingSuccessState ||
                                              c is OnAddToBookingErrorState ||
                                              c is OnAddToBookingCatchErrorState,
                                          builder: (context, bState) {
                                            return ButtonWidget(
                                              isLoading: bState
                                                      is OnAddToBookingLoadingState &&
                                                  HomeCubit.get(context)
                                                          .bookingLoadingId ==
                                                      item.id,
                                              buttonHeight: 44,
                                              buttonText: 'حجز العامله',
                                              borderRadius: 10,
                                              backGroundColor:
                                                  AppColors.greenColor31,
                                              borderColor:
                                                  AppColors.greenColor31,
                                              textStyle: TextStyles
                                                  .font16WhiteColorBold,
                                              onPressed: () =>
                                                  HomeCubit.get(context)
                                                      .addBooking(
                                                          context, item.id),
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              verticalSpace(12),
              // ── Dots indicator ──────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  cvs.length > 8 ? 8 : cvs.length,
                  (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: _currentPage == i ? 20 : 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: _currentPage == i
                          ? AppColors.greenColor31
                          : AppColors.greyColorD1,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _ActionBtn({required this.icon, required this.onTap});

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
  const _InfoChip(
      {required this.icon, required this.label, this.color, this.textColor});

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
          const SizedBox(width: 5),
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
