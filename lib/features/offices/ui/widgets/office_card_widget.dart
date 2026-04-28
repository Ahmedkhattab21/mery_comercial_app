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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.greyColorEE),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyColorEE,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 56.r,
              width: 56.r,
              decoration: BoxDecoration(
                color: AppColors.greenColorEA,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: office.imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(
                        office.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.business,
                          color: AppColors.greenColor31,
                          size: 28.r,
                        ),
                      ),
                    )
                  : Icon(
                      Icons.business,
                      color: AppColors.greenColor31,
                      size: 28.r,
                    ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    office.name,
                    style: TextStyles.font14BlackColorBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (office.phone != null) ...[
                    verticalSpace(4),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_outlined,
                          size: 14.r,
                          color: AppColors.greyColor64,
                        ),
                        horizontalSpace(4),
                        Text(
                          office.phone!,
                          style: TextStyles.font12greyColor64w400,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.r,
              color: AppColors.greenColor31,
            ),
          ],
        ),
      ),
    );
  }
}
