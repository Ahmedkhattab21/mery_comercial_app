import 'package:flutter/material.dart';
import '../utils/app_colors_white_theme.dart';
import '../utils/styles.dart';

class AppDropDownField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  final String hintText;
  final List<dynamic> items;

  final Widget? suffixIcon;
  final Color? backgroundColor;
  final bool? autofocus;
  final Widget? prefixIcon;
  final Function(dynamic) onChanged;

  const AppDropDownField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.textStyle,
    this.textAlign,
    required this.hintText,
    required this.items,
    this.suffixIcon,
    this.backgroundColor,
    this.prefixIcon,
    required this.onChanged,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      autofocus: autofocus!,
      dropdownColor: backgroundColor ?? AppColors.whiteColor,
        alignment:Alignment.centerRight,
      items: items.map((dynamic element) {
        return DropdownMenuItem<dynamic>(
          value: element,
          child: Text(
            element.name,
            selectionColor: AppColors.greenColor31.withValues(
              alpha: .2,
            ),
            style: textStyle ?? TextStyles.font16BlackColorWeight400,
          ),
        );
      }).toList(),
      menuMaxHeight: 300,

      onChanged: (dynamic item) {
        onChanged(item!);
      },
      isExpanded: true,
      decoration: InputDecoration(
        isDense: true,

        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyColorDC, width: 1.3),
              borderRadius: BorderRadius.circular(20),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyColorDC, width: 1.3),
              borderRadius: BorderRadius.circular(20),
            ),
        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redColor, width: 1.3),
              borderRadius: BorderRadius.circular(20),
            ),
        focusedErrorBorder:
            focusedErrorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redColor, width: 1.3),
              borderRadius: BorderRadius.circular(20),
            ),

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? AppColors.whiteColor,
        suffixIconColor:AppColors.greenColor31,
        filled: true,
      ),
      hint: Text(
        hintText,
        selectionColor: AppColors.greenColor31.withValues(
          alpha: .2,
        ),
        style: hintStyle ?? TextStyles.font16BlackColorWeight400,
      ),

      style: textStyle ?? TextStyles.font16BlackColorWeight400,
    );
  }
}
