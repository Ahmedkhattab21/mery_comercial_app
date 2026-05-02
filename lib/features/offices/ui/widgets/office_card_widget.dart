import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/offices/data/models/offices_response_model.dart';

class OfficeCardWidget extends StatelessWidget {
  final Office office;
  final VoidCallback onTap;

  const OfficeCardWidget({required this.office, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Green left accent bar
            Container(
              width: 5.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: AppColors.greenColor31,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.r),
                  bottomLeft: Radius.circular(18.r),
                ),
              ),
            ),
            horizontalSpace(14),
            // Logo
            Container(
              height: 54.r,
              width: 54.r,
              decoration: BoxDecoration(
                color: AppColors.greenColorEA,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: office.imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14.r),
                      child: Image.network(
                        office.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.business_rounded,
                          color: AppColors.greenColor31,
                          size: 28.r,
                        ),
                      ),
                    )
                  : Icon(
                      Icons.business_rounded,
                      color: AppColors.greenColor31,
                      size: 28.r,
                    ),
            ),
            horizontalSpace(14),
            // Info
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      office.name,
                      style: TextStyles.font14BlackColorBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            // Arrow
            Container(
              margin: EdgeInsets.only(left: 12.w, right: 14.w),
              width: 32.r,
              height: 32.r,
              decoration: BoxDecoration(
                color: AppColors.greenColorEA,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14.r,
                color: AppColors.greenColor31,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

