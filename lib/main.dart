import 'dart:async';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/core/utils/styles.dart';
import 'package:mery_comercial_app/my_app.dart';

import 'core/services/cache_helper.dart';
import 'core/services/check_network.dart';
import 'core/services/services_locator.dart';
import 'core/utils/app_constant.dart';
import 'observer.dart';

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message: ${message.data}");
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  // await dotenv.load(fileName: ".env");
  await ServicesLocator.init();
  await CacheHelper.init();

  // await LocalNotificationService.initializedNotification();

  await MyConnectivity.initialise();
  Bloc.observer = Observer();

  // bool isShowOnBoarding = await CacheHelper.getBool(
  //   ConstantKeys.saveIsShowIsBoardingToShared,
  // );

  await checkIfLoggedInUser();
  // await checkUserType();

  // End locations
  // try{
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //
  //   await FirebaseNotificationService.init();
  // }catch(error){
  //   print(error);
  // }

  runZonedGuarded(
    () {
      FlutterError.onError = (FlutterErrorDetails details) {
        // هنا نقدر نطبع الخطأ أو نرسله لـ Firebase Crashlytics أو نعرض شاشة
        FlutterError.presentError(details);
        print('🔴 Flutter framework error: ${details.exception}');
      };

      // استبدال شاشة الخطأ الحمراء بشيء أكثر أناقة
      ErrorWidget.builder = (FlutterErrorDetails details) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, color: Colors.red, size: 60),
                SizedBox(height: 12),
                Text(
                  "حدث خطأ غير متوقع ⚠️",

                  style: TextStyles.font16blackColor13W500,
                ),
                SizedBox(height: 8),
                Text(
                  "الرجاء المحاولة لاحقًا",
                  style: TextStyles.font14blackColor13W400.copyWith(
                    color: AppColors.blackColor13.withValues(alpha: .5),
                  ),
                ),
              ],
            ),
          ),
        );
      };
      runApp(
        EasyLocalization(
          supportedLocales: const [
            Locale('ar', 'EG'),
            Locale('en', 'US'), // English second1
            // Arabic first
          ],
          saveLocale: true,
          startLocale: const Locale('ar', 'EG'),
          path: 'assets/languages',
          fallbackLocale: const Locale('ar', 'EG'),
          child: MyApp(
            initialRoute: Routes.buttonNavigationBarScreen,
            // initialRoute: Routes.loginScreen,
            // isLoggedInUser
            //     ? Routes.sideBarScreen
            //     : Routes.loginScreen,
          ),
        ),
      );
    },
    (error, stack) {
      // لو حصل أي Exception خارج إطار Flutter UI
      print('🟠 Unhandled error: $error');
    },
  );
}

checkIfLoggedInUser() async {
  String? userToken = await CacheHelper.getSecuredString(
    ConstantKeys.saveTokenToShared,
  );
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

// checkUserType() async {
//   String? type = await CacheHelper.getSecuredString(
//     ConstantKeys.saveTypeToShared,
//   );
//   if (!type.isNullOrEmpty()) {
//     userType = type == 'UserType.employee'
//         ? UserType.employee
//         : type == 'UserType.contractor'
//         ? UserType.contractor
//         : UserType.client;
//   } else {
//     userType = null;
//   }
// }
