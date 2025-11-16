import 'package:flutter/material.dart';
import 'package:mery_comercial_app/core/utils/spacing.dart';
import 'package:mery_comercial_app/core/widgets/loading_widget.dart';

import '../utils/app_colors_white_theme.dart';

class ButtonWidget extends StatelessWidget {
  final bool isLoading;
  final double? borderRadius;
  final Color? borderColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? borderWidth;
  final Color? backGroundColor;
  final Color? fourGroundColor;
  final Color? iconColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final IconData? icon;
  final Widget? svgIcon; // 🔹 إضافة دعم SVG
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const ButtonWidget({
    super.key,
    required this.isLoading,
    this.borderRadius,
    this.borderColor,
    this.iconColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.borderWidth,
    this.backGroundColor,
    this.fourGroundColor,
    this.buttonHeight,
    this.buttonWidth,
    this.icon,
    this.svgIcon,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        height: buttonHeight ?? 50,
        width: buttonWidth ?? double.maxFinite,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 12,
          vertical: verticalPadding ?? 6,
        ),
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 20.0),
          border: Border.all(
            color: borderColor ?? AppColors.whiteColor,
            width: borderWidth ?? 0,
          ),
        ),
        child: isLoading
            ? LoadingWidget(color: fourGroundColor ?? AppColors.whiteColor)
            : (icon == null && svgIcon == null
                  ? Text(buttonText, style: textStyle, selectionColor: AppColors.greenColor31.withValues(alpha: .2),)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(buttonText, style: textStyle,selectionColor: AppColors.greenColor31.withValues(alpha: .2),),
                        horizontalSpace(5),
                        svgIcon ?? Icon(icon, color: iconColor, size: 18),
                      ],
                    )),
      ),
    );
  }
}
