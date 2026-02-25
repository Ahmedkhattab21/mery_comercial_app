import 'package:app_links/app_links.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mery_comercial_app/config/routes/app_routes.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/services/check_network.dart';
import 'package:mery_comercial_app/core/widgets/offline_alert_dialog.dart';
import 'config/themes/app_white_theme.dart';
import 'core/utils/app_colors_white_theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  final String initialRoute;

  const MyApp({required this.initialRoute, super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _listenToNetwork();
    checkIsFromOutLink();
  }

  void _listenToNetwork() {
    MyConnectivity.myStream.listen((event) {
      if (!MyConnectivity.isOnline()) {
        _showOfflineDialog();
      }
    });
  }

  checkIsFromOutLink() async {
    AppLinks appLinks = AppLinks(); // AppLinks is singleton
    appLinks.uriLinkStream.listen((uri) async {
      if (uri.scheme == "https" &&
          uri.host == "mery.alemtayaz.com" &&
          uri.path.startsWith("/cv/details/")) {
        await navigatorKey.currentState?.pushNamed(
          Routes.cvDetailsScreen,
          arguments: {'id': int.tryParse(uri.pathSegments.last) ?? 0},
          // (routes) => false,
        );
      }
    });
  }

  void _showOfflineDialog() {
    if (navigatorKey.currentContext == null) return;
    OfflineAlertDialog.getDialog();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, snapshot) {
        // getIt<AppConstant>().setLanguage(context.locale.languageCode);

        return Container(
          color: AppColors.whiteColor,
          child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            title: "mery App",
            theme: themeData(),
            initialRoute: widget.initialRoute,
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        );
      },
    );
  }
}
