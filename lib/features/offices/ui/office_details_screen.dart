import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/offices/data/models/offices_response_model.dart';
import 'package:mery_comercial_app/features/offices/logic/offices_cubit.dart';
import 'package:mery_comercial_app/features/offices/logic/offices_state.dart';
import 'package:shimmer/shimmer.dart';

class OfficeDetailsScreen extends StatelessWidget {
  final int id;

  const OfficeDetailsScreen({required this.id, super.key});

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
      ),
      body: BlocBuilder<OfficesCubit, OfficesState>(
        buildWhen: (previous, current) =>
            current is OnGetOfficeDetailsLoadingState ||
            current is OnGetOfficeDetailsSuccessState ||
            current is OnGetOfficeDetailsErrorState ||
            current is OnGetOfficeDetailsCatchErrorState,
        builder: (context, state) {
          if (state is OnGetOfficeDetailsLoadingState) {
            return _buildShimmer();
          }

          final Office? office = OfficesCubit.get(context).selectedOffice;

          if (office == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.business_outlined,
                    size: 64.r,
                    color: AppColors.greyColorAC,
                  ),
                  verticalSpace(12),
                  Text(
                    'تعذر تحميل بيانات المكتب',
                    style: TextStyles.font14greyColor64w400,
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                // ── Green gradient header ──────────────────────────────
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.greenColor31,
                        AppColors.greenColor31.withOpacity(0.80),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36.r),
                      bottomRight: Radius.circular(36.r),
                    ),
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
                      child: Column(
                        children: [
                          // Office logo
                          Container(
                            width: 104.r,
                            height: 104.r,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.18),
                                  blurRadius: 18,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: office.imageUrl != null
                                  ? Image.network(
                                      office.imageUrl!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) =>
                                          _officePlaceholderIcon(),
                                    )
                                  : _officePlaceholderIcon(),
                            ),
                          ),
                          verticalSpace(16),
                          Text(
                            office.name,
                            style: TextStyles.font18WhiteColorW600.copyWith(
                              fontSize: 20.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          if (office.address != null) ...[
                            verticalSpace(6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on,
                                    size: 14.r, color: Colors.white70),
                                horizontalSpace(4),
                                Flexible(
                                  child: Text(
                                    office.address!,
                                    style: TextStyles.font14WhiteColorW400.copyWith(
                                      color: Colors.white70,
                                      fontSize: 13.sp,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ],
                          verticalSpace(24),
                          // Quick actions
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (office.phone != null)
                                _QuickAction(
                                  icon: Icons.phone,
                                  label: 'اتصال',
                                  onTap: () => AppConstant.openUrl(
                                      'tel:${office.phone}'),
                                ),
                              if (office.phone != null && office.email != null)
                                horizontalSpace(20),
                              if (office.email != null)
                                _QuickAction(
                                  icon: Icons.email,
                                  label: 'بريد',
                                  onTap: () => AppConstant.openUrl(
                                      'mailto:${office.email}'),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // ── Info cards ────────────────────────────────────────
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'معلومات المكتب',
                        style: TextStyles.font18BlackColor13bold,
                      ),
                      verticalSpace(14),
                      if (office.phone != null)
                        _InfoCard(
                          icon: Icons.phone_outlined,
                          iconColor: const Color(0xFF4CAF50),
                          iconBg: const Color(0xFFE8F5E9),
                          label: 'رقم الهاتف',
                          value: office.phone!,
                          onTap: () =>
                              AppConstant.openUrl('tel:${office.phone}'),
                        ),
                      if (office.email != null)
                        _InfoCard(
                          icon: Icons.email_outlined,
                          iconColor: const Color(0xFF2196F3),
                          iconBg: const Color(0xFFE3F2FD),
                          label: 'البريد الإلكتروني',
                          value: office.email!,
                          onTap: () =>
                              AppConstant.openUrl('mailto:${office.email}'),
                        ),
                      if (office.address != null)
                        _InfoCard(
                          icon: Icons.map_outlined,
                          iconColor: const Color(0xFFFF9800),
                          iconBg: const Color(0xFFFFF3E0),
                          label: 'العنوان',
                          value: office.address!,
                        ),
                      verticalSpace(40),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _officePlaceholderIcon() {
    return Container(
      color: AppColors.greenColorEA,
      child: Icon(
        Icons.business,
        size: 52.r,
        color: AppColors.greenColor31,
      ),
    );
  }

  Widget _buildShimmer() {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 300.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36.r),
                bottomRight: Radius.circular(36.r),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: List.generate(
                3,
                (_) => Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  height: 68.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 52.r,
            height: 52.r,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.5)),
            ),
            child: Icon(icon, color: Colors.white, size: 24.r),
          ),
          verticalSpace(6),
          Text(
            label,
            style: TextStyles.font12greyColor64w400.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String label;
  final String value;
  final VoidCallback? onTap;

  const _InfoCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: iconColor, size: 20.r),
            ),
            horizontalSpace(14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyles.font12greyColor64w400),
                  verticalSpace(3),
                  Text(value, style: TextStyles.font14blackColor13w500),
                ],
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.arrow_forward_ios,
                size: 14.r,
                color: AppColors.greyColorAC,
              ),
          ],
        ),
      ),
    );
  }
}
