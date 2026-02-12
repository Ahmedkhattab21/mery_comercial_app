import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/button_widget.dart';
import 'package:mery_comercial_app/features/all_cvs/logic/all_cvs_cubit.dart';
import 'package:mery_comercial_app/features/all_cvs/logic/all_cvs_state.dart';
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
          return Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.only(top: 12.w),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 160.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            Container(color: Colors.grey.shade300),
                            verticalSpace(8),
                            Container(color: Colors.grey.shade300),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          if (AllCvsCubit.get(context).nationalityCvs.isEmpty) {
            return Center(child: Icon(Icons.image_not_supported_outlined));
          } else {
            return Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: AllCvsCubit.get(context).nationalityCvs
                      .map(
                        (item) => GestureDetector(
                          onTap: () {
                            context.pushNamed(
                              Routes.cvDetailsScreen,
                              arguments: {'id': item.id},
                            );
                            // AppConstant.openUrl(item.cvFile.url);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 24,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.greyColorEE),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        AppConstant.openUrl(item.cvFile.url);
                                      },
                                      child: Container(
                                        height: 74,
                                        width: 74,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: AppColors.greyColorEE,
                                          ),
                                        ),
                                        child: SvgPicture.asset(
                                          ImageAsset.pdfImage,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        // AllCvsCubit.get(
                                        //   context,
                                        // ).addToFavorite(
                                        //   context,
                                        //   item.id,
                                        // );
                                      },
                                      icon: Icon(Icons.share),
                                      color: AppColors.greyColorAC,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        AllCvsCubit.get(
                                          context,
                                        ).addToFavorite(context, item.id);
                                      },
                                      icon: Icon(Icons.favorite_border),
                                      color: AppColors.greyColorAC,
                                    ),
                                  ],
                                ),
                                verticalSpace(12),
                                Text(
                                  item.cvFile.name,
                                  maxLines: 2,
                                  selectionColor: AppColors.greenColor31
                                      .withValues(alpha: .2),
                                  style: TextStyles.font14BlackColorBold,
                                ),
                                verticalSpace(8),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      ImageAsset.countryIcon2,
                                      height: 20,
                                      width: 20,
                                    ),
                                    horizontalSpace(4),
                                    Expanded(
                                      child: Text(
                                        item.nationality.name,
                                        maxLines: 1,
                                        selectionColor: AppColors.greenColor31
                                            .withValues(alpha: .2),
                                        style: TextStyles.font14BlackColorW400,
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpace(8),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      ImageAsset.starAwardIcon,
                                      height: 20,
                                      width: 20,
                                    ),
                                    horizontalSpace(4),
                                    Expanded(
                                      child: Text(
                                        item.hasExperience
                                            ? 'لديها خبره'
                                            : 'ليس لديها خبره ',
                                        maxLines: 1,
                                        selectionColor: AppColors.greenColor31
                                            .withValues(alpha: .2),
                                        style: TextStyles.font14BlackColorW400,
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpace(8),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      ImageAsset.ramadhanIcon,
                                      height: 20,
                                      width: 20,
                                    ),
                                    horizontalSpace(4),
                                    Expanded(
                                      child: Text(
                                        item.isMuslim ? 'مسلمة' : 'غير مسلمة',
                                        maxLines: 1,
                                        selectionColor: AppColors.greenColor31
                                            .withValues(alpha: .2),
                                        style: TextStyles.font14BlackColorW400,
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpace(18),
                                if (item.approvedBy < 3)
                                  BlocBuilder<AllCvsCubit, AllCvsState>(
                                    buildWhen: (previous, current) {
                                      return current
                                              is OnAddToBookingLoadingState ||
                                          current
                                              is OnAddToBookingSuccessState ||
                                          current is OnAddToBookingErrorState ||
                                          current
                                              is OnAddToBookingCatchErrorState;
                                    },
                                    builder: (context, state) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 24.w,
                                        ),
                                        child: ButtonWidget(
                                          isLoading:
                                              state
                                                  is OnAddToBookingLoadingState &&
                                              AllCvsCubit.get(
                                                    context,
                                                  ).bookingLoadingId ==
                                                  item.id,
                                          buttonHeight: 40,
                                          buttonText: 'حجز العامله ',
                                          borderRadius: 6,
                                          backGroundColor: AppColors
                                              .greenColor31
                                              .withValues(alpha: .9),
                                          borderColor: AppColors.greenColor31,
                                          textStyle:
                                              TextStyles.font16WhiteColorBold,
                                          onPressed: () {
                                            AllCvsCubit.get(
                                              context,
                                            ).addBooking(context, item.id);
                                          },
                                        ),
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          }
        }
      },
    );
  }
}
