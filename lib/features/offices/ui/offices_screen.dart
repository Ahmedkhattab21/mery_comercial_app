import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/widgets/empty_state_widget.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/offices/logic/offices_cubit.dart';
import 'package:mery_comercial_app/features/offices/logic/offices_state.dart';
import 'package:mery_comercial_app/features/offices/ui/widgets/office_card_widget.dart';
import 'package:shimmer/shimmer.dart';

class OfficesScreen extends StatefulWidget {
  const OfficesScreen({super.key});

  @override
  State<OfficesScreen> createState() => _OfficesScreenState();
}

class _OfficesScreenState extends State<OfficesScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: Text('المكاتب', style: TextStyles.font18WhiteColorW600),
        backgroundColor: AppColors.greenColor31,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              verticalSpace(16),
              // Search bar
              TextField(
                controller: _searchController,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: 'ابحث عن مكتب...',
                  hintStyle: TextStyles.font14greyColor64w500,
                  prefixIcon: Icon(Icons.search, color: AppColors.greyColorAC),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear, color: AppColors.greyColorAC),
                          onPressed: () {
                            _searchController.clear();
                            OfficesCubit.get(context).getOffices();
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: AppColors.greyColorF7,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: AppColors.greyColorEE),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: AppColors.greenColor31),
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                  if (value.length >= 2 || value.isEmpty) {
                    OfficesCubit.get(context).getOffices(
                      q: value.isEmpty ? null : value,
                    );
                  }
                },
              ),
              verticalSpace(16),
              // List
              Expanded(
                child: BlocBuilder<OfficesCubit, OfficesState>(
                  buildWhen: (previous, current) =>
                      current is OnGetOfficesLoadingState ||
                      current is OnGetOfficesSuccessState ||
                      current is OnGetOfficesErrorState ||
                      current is OnGetOfficesCatchErrorState,
                  builder: (context, state) {
                    if (state is OnGetOfficesLoadingState) {
                      return ListView.builder(
                        itemCount: 6,
                        itemBuilder: (_, __) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              height: 84.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    final offices = OfficesCubit.get(context).offices;

                    if (offices.isEmpty) {
                      return EmptyStateWidget(
                        svgAsset: ImageAsset.officeIcon,
                        title: 'لا توجد مكاتب',
                        subtitle: 'لا تتوفر مكاتب حالياً',
                      );
                    }

                    return ListView.builder(
                      itemCount: offices.length,
                      itemBuilder: (context, index) => OfficeCardWidget(
                        office: offices[index],
                        onTap: () {
                          context.pushNamed(
                            Routes.officeDetailsScreen,
                            arguments: {'office': offices[index]},
                          );
                        },
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
  }
}
