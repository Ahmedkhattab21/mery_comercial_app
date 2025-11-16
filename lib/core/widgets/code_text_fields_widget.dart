// import 'package:eventix_app/core/services/check_network.dart';
// import 'package:eventix_app/core/utils/app_colors_white_theme.dart';
// import 'package:eventix_app/core/utils/app_constant.dart';
// import 'package:eventix_app/core/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pinput/pinput.dart';
//
// class CodesTextFields extends StatelessWidget {
//   const CodesTextFields({super.key, required this.controller});
//   final TextEditingController? controller;
//   @override
//   Widget build(BuildContext context) {
//     return Pinput(
//       length: 6,
//       keyboardType: TextInputType.number,
//       enableSuggestions: true,
//       controller: controller,
//       inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//       pinputAutovalidateMode: PinputAutovalidateMode.disabled,
//       defaultPinTheme: PinTheme(
//         width: 65.r,
//         height: 65.r,
//         textStyle: TextStyles.font16WhiteColorW600,
//         decoration: BoxDecoration(
//           color: Colors.transparent,
//           border: Border.all(
//             color: AppColors.greyColorF8.withValues(alpha: .2),
//             width: 1.3,
//           ),
//           shape: BoxShape.circle,
//         ),
//       ),
//       focusedPinTheme: PinTheme(
//         width: 65.r,
//         height: 65.r,
//         textStyle: TextStyles.font16WhiteColorW600,
//         decoration: BoxDecoration(
//           color: Colors.transparent,
//           border: Border.all(
//             color: AppColors.greyColorF8.withValues(alpha: .2),
//             width: 1.3,
//           ),
//           shape: BoxShape.circle,
//         ),
//       ),
//       submittedPinTheme: PinTheme(
//         width: 65.r,
//         height: 65.r,
//         textStyle: TextStyles.font16WhiteColorW600,
//         decoration: BoxDecoration(
//           color: Colors.transparent,
//           border: Border.all(
//             color: AppColors.greyColorF8.withValues(alpha: .2),
//             width: 1.3,
//           ),
//           shape: BoxShape.circle,
//         ),
//       ),
//       showCursor: true,
//       onCompleted: (String? value) {
//         if (MyConnectivity.isOnline()) {
//           // SendCodeCubit.get(context).verifyCode();
//         } else {
//           AppConstant.toast("Check Internet Connection", AppColors.redColor);
//         }
//       },
//     );
//   }
// }
