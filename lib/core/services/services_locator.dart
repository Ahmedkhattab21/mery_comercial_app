import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:get_it/get_it.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/features/forget_password/data/repo/forget_password_repo.dart';
import 'package:mery_comercial_app/features/forget_password/data/services/forget_password_service.dart';
import 'package:mery_comercial_app/features/forget_password_2/data/repo/forget_password_2_repo.dart';
import 'package:mery_comercial_app/features/forget_password_2/data/services/forget_password_2_service.dart';
import 'package:mery_comercial_app/features/login/data/repo/login_repo.dart';
import 'package:mery_comercial_app/features/login/data/services/login_service.dart';
import 'package:mery_comercial_app/features/register/data/repo/register_repo.dart';
import 'package:mery_comercial_app/features/register/data/services/register_service.dart';
import 'package:mery_comercial_app/features/reset_password/data/repo/reset_password_repo.dart';
import 'package:mery_comercial_app/features/reset_password/data/services/reset_password_service.dart';
import 'package:mery_comercial_app/features/reset_password/logic/reset_password_cubit.dart';

import '../api/api_consumer.dart';
import '../api/app_interceptor.dart';
import '../api/http_consumer.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  static Future<void> init() async {
    /// Login
    getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
    getIt.registerFactory<LoginService>(
      () => LoginService(apiConsumer: getIt()),
    );

    /// Register
    getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
    getIt.registerFactory<RegisterService>(
      () => RegisterService(apiConsumer: getIt()),
    );

    /// ForgetPassword
    getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepo(getIt()),
    );
    getIt.registerFactory<ForgetPasswordService>(
      () => ForgetPasswordService(apiConsumer: getIt()),
    );

    /// ForgetPassword2
    getIt.registerLazySingleton<ForgetPassword2Repo>(
      () => ForgetPassword2Repo(getIt()),
    );
    getIt.registerFactory<ForgetPassword2Service>(
      () => ForgetPassword2Service(apiConsumer: getIt()),
    );
    /// ResetPassword
    getIt.registerLazySingleton<ResetPasswordRepo>(
      () => ResetPasswordRepo(getIt()),
    );
    getIt.registerFactory<ResetPasswordService>(
      () => ResetPasswordService(apiConsumer: getIt()),
    );

    ///constant
    // getIt.registerLazySingleton<EndPoints>(() => EndPoints());
    getIt.registerLazySingleton<AppConstant>(() => AppConstant());
    getIt.registerLazySingleton<AppColors>(() => AppColors());

    ///core

    getIt.registerLazySingleton<AppInterceptor>(() => AppInterceptor());

    getIt.registerLazySingleton<ApiConsumer>(() => HttpConsumer(getIt()));
    getIt.registerLazySingleton(() => http.Client());

    ///shared secure
    FlutterSecureStorage secureStorage = FlutterSecureStorage();
    getIt.registerLazySingleton(() => secureStorage);
  }
}
