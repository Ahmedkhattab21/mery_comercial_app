import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/features/button_navigation_bar/logic/button_navigation_bar_cubit.dart';
import 'package:mery_comercial_app/features/button_navigation_bar/logic/button_navigation_bar_state.dart';
import 'package:mery_comercial_app/features/button_navigation_bar/models/buttom_model.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ButtonNavigationBarScreen extends StatefulWidget {
  const ButtonNavigationBarScreen({super.key});

  @override
  State<ButtonNavigationBarScreen> createState() =>
      _ButtonNavigationBarScreenState();
}

class _ButtonNavigationBarScreenState extends State<ButtonNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonNavigationBarCubit, ButtonNavigationBarState>(
      buildWhen: (previous, current) {
        return current is OnBottomNavBarChangedState;
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Center(
            child: ButtonNavigationBarCubit.get(context).buttonBarBody(),
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border(
                  top: BorderSide(
                    color: AppColors.greyColro8D.withValues(
                      alpha: .12,
                    ), // your color
                    width: 1, // border width
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ButtonNavigationBarCubit.get(context).items
                    .asMap()
                    .entries
                    .map(
                      (element) => InkWell(
                        onTap: () {
                          ButtonNavigationBarCubit.get(
                            context,
                          ).changeIndex(element.key);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ButtonNavigationBarCubit.get(
                                        context,
                                      ).currentIndex ==
                                      element.key
                                  ? element.value.selectedImage
                                  : element.value.image,
                            ),
                            verticalSpace(8),
                            Text(
                              element.value.text,
                              style: TextStyles.font14blackColor13W400.copyWith(
                                fontWeight:
                                    ButtonNavigationBarCubit.get(
                                          context,
                                        ).currentIndex ==
                                        element.key
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                            ),
                            verticalSpace(8),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 6,
                              width: 6,
                              decoration: BoxDecoration(
                                color:
                                    ButtonNavigationBarCubit.get(
                                          context,
                                        ).currentIndex ==
                                        element.key
                                    ? AppColors.orangeColor22
                                    : AppColors.whiteColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
