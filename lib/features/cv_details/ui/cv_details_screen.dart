import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';

import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/core/widgets/button_widget.dart';
import 'package:mery_comercial_app/features/cv_details/logic/cv_details_cubit.dart';
import 'package:mery_comercial_app/features/cv_details/logic/cv_details_state.dart';
import 'package:shimmer/shimmer.dart';

class CvDetailsScreen extends StatelessWidget {
  final int id;

  const CvDetailsScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              context.pop();
            }
          },
          icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
        ),
        title: Text('السيرة الذاتية', style: TextStyles.font18WhiteColorW600),
        backgroundColor: AppColors.greenColor31,
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<CvDetailsCubit, CvDetailsState>(
          buildWhen: (previous, current) {
            return current is OnGetDetailsLoadingState ||
                current is OnGetDetailsSuccessState ||
                current is OnGetDetailsErrorState ||
                current is OnGetDetailsCatchErrorState;
          },
          builder: (context, state) {
            if (state is OnGetDetailsLoadingState &&
                CvDetailsCubit.get(context).cvDetailsResponseModel == null) {
              return Column(
                children: List.generate(
                  1,
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
              );
            } else {
              if (CvDetailsCubit.get(context).cvDetailsResponseModel == null) {
                return Center(child: Icon(Icons.image_not_supported_outlined));
              } else {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(16),

                      Container(
                        height: 400.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: AppColors.greyColorEE),
                        ),
                        child: SfPdfViewer.network(
                          CvDetailsCubit.get(
                            context,
                          ).cvDetailsResponseModel!.cvFile.url,
                        ),
                      ),

                      verticalSpace(24),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              CvDetailsCubit.get(
                                context,
                              ).cvDetailsResponseModel!.cvFile.name,
                              selectionColor: AppColors.greenColor31.withValues(
                                alpha: .2,
                              ),
                              style: TextStyles.font18BlackColorBold,
                            ),
                          ),
                          ButtonWidget(
                            isLoading: false,
                            buttonHeight: 40.h,
                            buttonWidth: 60.w,
                            buttonText: 'فتح',
                            borderRadius: 12,
                            backGroundColor: AppColors.greenColor31.withValues(
                              alpha: .9,
                            ),
                            borderColor: AppColors.greenColor31,
                            textStyle: TextStyles.font14WhiteColorW400,
                            onPressed: () {
                              AppConstant.openUrl(
                                CvDetailsCubit.get(
                                  context,
                                ).cvDetailsResponseModel!.cvFile.url,
                              );
                            },
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      Row(
                        children: [
                          SvgPicture.asset(
                            ImageAsset.countryIcon2,
                            height: 24,
                            width: 24,
                          ),
                          horizontalSpace(4),
                          Expanded(
                            child: Text(
                              CvDetailsCubit.get(
                                context,
                              ).cvDetailsResponseModel!.nationality.name,
                              maxLines: 1,
                              selectionColor: AppColors.greenColor31.withValues(
                                alpha: .2,
                              ),
                              style: TextStyles.font16BlackColorW400,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              SharePlus.instance.share(
                                ShareParams(
                                  text:
                                      'https://mery.alemtayaz.com/cv/details/${CvDetailsCubit.get(context).cvDetailsResponseModel!.id}',
                                ),
                              );
                            },
                            icon: Icon(Icons.share),
                            color: AppColors.greyColorAC,
                          ),
                          IconButton(
                            onPressed: () {
                              CvDetailsCubit.get(context).addToFavorite(
                                context,
                                CvDetailsCubit.get(
                                  context,
                                ).cvDetailsResponseModel!.id,
                              );
                            },
                            icon: Icon(Icons.favorite_border),
                            color: AppColors.greyColorAC,
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      Row(
                        children: [
                          SvgPicture.asset(
                            ImageAsset.starAwardIcon,
                            height: 24,
                            width: 24,
                          ),
                          horizontalSpace(4),
                          Expanded(
                            child: Text(
                              CvDetailsCubit.get(
                                    context,
                                  ).cvDetailsResponseModel!.hasExperience
                                  ? 'لديها خبره'
                                  : 'ليس لديها خبره ',
                              maxLines: 1,
                              selectionColor: AppColors.greenColor31.withValues(
                                alpha: .2,
                              ),
                              style: TextStyles.font16BlackColorW400,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      Row(
                        children: [
                          SvgPicture.asset(
                            ImageAsset.ramadhanIcon,
                            height: 24,
                            width: 24,
                          ),
                          horizontalSpace(4),
                          Expanded(
                            child: Text(
                              CvDetailsCubit.get(
                                    context,
                                  ).cvDetailsResponseModel!.isMuslim
                                  ? 'مسلمة'
                                  : 'غير مسلمة',
                              maxLines: 1,
                              selectionColor: AppColors.greenColor31.withValues(
                                alpha: .2,
                              ),
                              style: TextStyles.font16BlackColorW400,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(50),
                      if (CvDetailsCubit.get(
                            context,
                          ).cvDetailsResponseModel!.approvedBy <
                          3)
                        BlocBuilder<CvDetailsCubit, CvDetailsState>(
                          buildWhen: (previous, current) {
                            return current is OnAddToBookingLoadingState ||
                                current is OnAddToBookingSuccessState ||
                                current is OnAddToBookingErrorState ||
                                current is OnAddToBookingCatchErrorState;
                          },
                          builder: (context, state) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: ButtonWidget(
                                isLoading: state is OnAddToBookingLoadingState,
                                buttonHeight: 48.h,
                                buttonText: 'حجز العامله ',
                                borderRadius: 12,
                                backGroundColor: AppColors.greenColor31
                                    .withValues(alpha: .9),
                                borderColor: AppColors.greenColor31,
                                textStyle: TextStyles.font18WhiteColorBold,
                                onPressed: () {
                                  CvDetailsCubit.get(context).addBooking(
                                    context,
                                    CvDetailsCubit.get(
                                      context,
                                    ).cvDetailsResponseModel!.id,
                                  );
                                },
                              ),
                            );
                          },
                        ),

                      verticalSpace(40),
                    ],
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
