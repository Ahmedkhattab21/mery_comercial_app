import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/services/firebase_notification_service.dart';
import 'package:mery_comercial_app/core/services/local_notification_service.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/core/utils/extentions.dart';
import 'package:mery_comercial_app/firebase_options.dart';
import 'package:mery_comercial_app/my_app.dart';

import 'core/services/cache_helper.dart';
import 'core/services/check_network.dart';
import 'core/services/services_locator.dart';
import 'core/utils/app_constant.dart';
import 'observer.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.data}");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await dotenv.load(fileName: ".env");
  await ServicesLocator.init();
  await CacheHelper.init();

  await LocalNotificationService.initializedNotification();

  await MyConnectivity.initialise();
  Bloc.observer = Observer();


  await checkIfLoggedInUser();

  // End locations
  try{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await FirebaseNotificationService.init();
  }catch(error){
    print(error);
  }

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
        initialRoute: isLoggedInUser
            ? Routes.buttonNavigationBarScreen
            : Routes.loginScreen,
      ),
    ),
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
