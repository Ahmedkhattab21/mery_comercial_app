import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    super.key,
    this.svgAsset,
    required this.title,
    this.subtitle,
    this.expanded = false,
  });

  final String? svgAsset;
  final String title;
  final String? subtitle;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (svgAsset != null)
          Container(
            width: 120.w,
            height: 120.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greenColorEA,
            ),
            child: Center(
              child: SvgPicture.asset(
                svgAsset!,
                width: 52.w,
                height: 52.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.greenColor31,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        verticalSpace(24),
        Text(
          title,
          style: TextStyles.font18WhiteColorW600.copyWith(
            color: AppColors.greenColor31,
          ),
        ),
        if (subtitle != null) ...[
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: TextStyles.font14greyColor69w400.copyWith(
                color: AppColors.greyColorAC,
              ),
            ),
          ),
        ],
      ],
    );

    if (expanded) {
      return Expanded(child: Center(child: content));
    }
    return Center(child: content);
  }
}
