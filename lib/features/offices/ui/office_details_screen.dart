import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:mery_comercial_app/config/routes/routes.dart";
import "package:mery_comercial_app/core/utils/app_colors_white_theme.dart";
import "package:mery_comercial_app/core/utils/assets_manager.dart";
import "package:mery_comercial_app/core/utils/extentions.dart";
import "package:mery_comercial_app/core/utils/spacing.dart";
import "package:mery_comercial_app/core/utils/styles.dart";
import "package:mery_comercial_app/core/widgets/button_widget.dart";
import "package:mery_comercial_app/core/widgets/empty_state_widget.dart";
import "package:mery_comercial_app/features/all_cvs/logic/all_cvs_cubit.dart";
import "package:mery_comercial_app/features/all_cvs/logic/all_cvs_state.dart";
import "package:mery_comercial_app/features/offices/data/models/offices_response_model.dart";
import "package:shimmer/shimmer.dart";

class OfficeDetailsScreen extends StatelessWidget {
  final Office office;
  const OfficeDetailsScreen({required this.office, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColorF7,
      body: Column(
        children: [
          _Header(office: office),
          _FilterBar(),
          Expanded(child: _CvsList()),
        ],
      ),
    );
  }
}

// ── Header ────────────────────────────────────────────────────────────────────
class _Header extends StatelessWidget {
  final Office office;
  const _Header({required this.office});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greenColor31,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28.r),
          bottomRight: Radius.circular(28.r),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 20.h),
          child: Column(
            children: [
              // Back button row
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 36.r,
                      height: 36.r,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back, color: Colors.white, size: 18.r),
                    ),
                  ),
                ],
              ),
              verticalSpace(12),
              // Logo
              Container(
                width: 80.r,
                height: 80.r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: office.imageUrl != null
                      ? Image.network(
                          office.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _placeholder(),
                        )
                      : _placeholder(),
                ),
              ),
              verticalSpace(10),
              Text(
                office.name,
                style: TextStyles.font18WhiteColorW600,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (office.address != null) ...[
                verticalSpace(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined, size: 12.r, color: Colors.white70),
                    horizontalSpace(3),
                    Flexible(
                      child: Text(
                        office.address!,
                        style: TextStyles.font12greyColor64w400.copyWith(
                            color: Colors.white70),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _placeholder() => Container(
        color: AppColors.greenColorEA,
        child: Icon(Icons.business, size: 40.r, color: AppColors.greenColor31),
      );
}

// ── Filter Bar ────────────────────────────────────────────────────────────────
class _FilterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCvsCubit, AllCvsState>(
      buildWhen: (p, c) =>
          c is OnOfficeFilterChangedState ||
          c is OnGetNationalityCvsLoadingState ||
          c is OnGetNationalityCvsSuccessState,
      builder: (context, state) {
        final cubit = AllCvsCubit.get(context);
        return Container(
          color: AppColors.greyColorF7,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Row(
            children: [
              SvgPicture.asset(ImageAsset.filterIcon, width: 16.r, height: 16.r,
                  colorFilter: ColorFilter.mode(AppColors.greenColor31, BlendMode.srcIn)),
              horizontalSpace(8),
              _FilterChip(
                label: "الديانة",
                selected: cubit.isMuslims != null,
                activeLabel: cubit.isMuslims == true ? "مسلمة" : "غير مسلمة",
                onTap: () => _showReligionSheet(context, cubit),
              ),
              horizontalSpace(8),
              _FilterChip(
                label: "الخبرة",
                selected: cubit.isExperience != null,
                activeLabel: cubit.isExperience == true ? "لديها خبرة" : "بدون خبرة",
                onTap: () => _showExperienceSheet(context, cubit),
              ),
              if (cubit.isMuslims != null || cubit.isExperience != null) ...[
                horizontalSpace(8),
                GestureDetector(
                  onTap: () {
                    cubit.isMuslims = null;
                    cubit.changeOfficeIsExperience(null);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: Text(
                      "مسح",
                      style: TextStyles.font12greyColor64w400.copyWith(
                          color: Colors.red.shade400, fontSize: 11.sp),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  void _showReligionSheet(BuildContext context, AllCvsCubit cubit) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      builder: (_) => Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 4, decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2))),
            verticalSpace(16),
            Text("الديانة", style: TextStyles.font18BlackColor13bold),
            verticalSpace(16),
            _SheetOption(
              label: "مسلمة",
              selected: cubit.isMuslims == true,
              onTap: () { Navigator.pop(context); cubit.changeOfficeIsMuslims(true); },
            ),
            _SheetOption(
              label: "غير مسلمة",
              selected: cubit.isMuslims == false,
              onTap: () { Navigator.pop(context); cubit.changeOfficeIsMuslims(false); },
            ),
            verticalSpace(8),
          ],
        ),
      ),
    );
  }

  void _showExperienceSheet(BuildContext context, AllCvsCubit cubit) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      builder: (_) => Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 4, decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2))),
            verticalSpace(16),
            Text("الخبرة", style: TextStyles.font18BlackColor13bold),
            verticalSpace(16),
            _SheetOption(
              label: "لديها خبرة",
              selected: cubit.isExperience == true,
              onTap: () { Navigator.pop(context); cubit.changeOfficeIsExperience(true); },
            ),
            _SheetOption(
              label: "بدون خبرة",
              selected: cubit.isExperience == false,
              onTap: () { Navigator.pop(context); cubit.changeOfficeIsExperience(false); },
            ),
            verticalSpace(8),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final String activeLabel;
  final VoidCallback onTap;
  const _FilterChip({required this.label, required this.selected,
      required this.activeLabel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.greenColorF3 : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected ? AppColors.greenColor31 : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selected ? activeLabel : label,
              style: TextStyles.font12greyColor64w400.copyWith(
                color: selected ? AppColors.greenColor31 : AppColors.greyColor8B,
                fontSize: 12.sp,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
            horizontalSpace(4),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 16.r,
              color: selected ? AppColors.greenColor31 : AppColors.greyColor8B,
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _SheetOption({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.greenColorF3 : Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: selected ? AppColors.greenColor31 : Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected ? Icons.check_circle : Icons.circle_outlined,
              color: selected ? AppColors.greenColor31 : Colors.grey.shade400,
              size: 20.r,
            ),
            horizontalSpace(12),
            Text(label, style: TextStyles.font14blackColor13w500.copyWith(
              color: selected ? AppColors.greenColor31 : null,
            )),
          ],
        ),
      ),
    );
  }
}

// ── CVs List ──────────────────────────────────────────────────────────────────
class _CvsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCvsCubit, AllCvsState>(
      buildWhen: (p, c) =>
          c is OnGetNationalityCvsLoadingState ||
          c is OnGetNationalityCvsSuccessState ||
          c is OnGetNationalityCvsErrorState ||
          c is OnGetNationalityCvsCatchErrorState,
      builder: (context, state) {
        if (state is OnGetNationalityCvsLoadingState) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            itemCount: 6,
            itemBuilder: (_, __) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
              ),
            ),
          );
        }

        final cvs = AllCvsCubit.get(context).nationalityCvs;

        if (cvs.isEmpty) {
          return EmptyStateWidget(
            svgAsset: ImageAsset.profileIcon,
            title: "لا توجد سير ذاتية",
            subtitle: "لا تتوفر سير ذاتية لهذا المكتب",
            expanded: true,
          );
        }

        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          itemCount: cvs.length,
          itemBuilder: (context, index) {
            final item = cvs[index];
            return GestureDetector(
              onTap: () => context.pushNamed(
                Routes.cvDetailsScreen,
                arguments: {"id": item.id},
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 44.r,
                          height: 44.r,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEBEE),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              ImageAsset.pdfImage,
                              width: 26.r,
                              height: 26.r,
                            ),
                          ),
                        ),
                        horizontalSpace(12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.cvFile.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.font14blackColor13w500,
                              ),
                              verticalSpace(4),
                              Text(
                                item.nationality.name,
                                style: TextStyles.font12greyColor64w400.copyWith(
                                  color: AppColors.greyColor8B,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        horizontalSpace(8),
                        Icon(Icons.arrow_forward_ios_rounded,
                            size: 14.r, color: AppColors.greyColorAC),
                      ],
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        _Tag(
                          label: item.hasExperience ? "لديها خبرة" : "بدون خبرة",
                          green: item.hasExperience,
                        ),
                        horizontalSpace(6),
                        _Tag(
                          label: item.isMuslim ? "مسلمة" : "غير مسلمة",
                          green: item.isMuslim,
                        ),
                      ],
                    ),
                    if (item.approvedBy < 3) ...[
                      verticalSpace(10),
                      BlocBuilder<AllCvsCubit, AllCvsState>(
                        buildWhen: (p, c) =>
                            c is OnAddToBookingLoadingState ||
                            c is OnAddToBookingSuccessState ||
                            c is OnAddToBookingErrorState ||
                            c is OnAddToBookingCatchErrorState,
                        builder: (context, bookState) {
                          return ButtonWidget(
                            isLoading: bookState is OnAddToBookingLoadingState &&
                                AllCvsCubit.get(context).bookingLoadingId == item.id,
                            buttonHeight: 40,
                            buttonText: "حجز العامله",
                            borderRadius: 10,
                            backGroundColor: AppColors.greenColor31,
                            borderColor: AppColors.greenColor31,
                            textStyle: TextStyles.font16WhiteColorBold,
                            onPressed: () {
                              AllCvsCubit.get(context).addBooking(context, item.id);
                            },
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  final bool green;
  const _Tag({required this.label, required this.green});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: green ? AppColors.greenColorF3 : AppColors.greyColorF7,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyles.font12greyColor64w400.copyWith(
          color: green ? AppColors.greenColor31 : AppColors.greyColor8B,
          fontSize: 11.sp,
        ),
      ),
    );
  }
}