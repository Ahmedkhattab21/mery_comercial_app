import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:get_it/get_it.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/features/all_cvs/data/repo/all_cvs_repo.dart';
import 'package:mery_comercial_app/features/all_cvs/data/services/all_cvs_service.dart';
import 'package:mery_comercial_app/features/booking/data/repo/booking_repo.dart';
import 'package:mery_comercial_app/features/booking/data/services/booking_service.dart';
import 'package:mery_comercial_app/features/edit_profile/data/repo/edit_profile_repo.dart';
import 'package:mery_comercial_app/features/edit_profile/data/services/edit_profile_service.dart';
import 'package:mery_comercial_app/features/favorite/data/repo/favorite_repo.dart';
import 'package:mery_comercial_app/features/favorite/data/services/favorite_service.dart';
import 'package:mery_comercial_app/features/forget_password/data/repo/forget_password_repo.dart';
import 'package:mery_comercial_app/features/forget_password/data/services/forget_password_service.dart';
import 'package:mery_comercial_app/features/forget_password_2/data/repo/forget_password_2_repo.dart';
import 'package:mery_comercial_app/features/forget_password_2/data/services/forget_password_2_service.dart';
import 'package:mery_comercial_app/features/home/data/repo/home_repo.dart';
import 'package:mery_comercial_app/features/home/data/services/home_service.dart';
import 'package:mery_comercial_app/features/login/data/repo/login_repo.dart';
import 'package:mery_comercial_app/features/login/data/services/login_service.dart';
import 'package:mery_comercial_app/features/page_contain_content/data/repo/page_contain_content_repo.dart';
import 'package:mery_comercial_app/features/page_contain_content/data/services/page_contain_content_service.dart';
import 'package:mery_comercial_app/features/profile/data/repo/profile_repo.dart';
import 'package:mery_comercial_app/features/profile/data/services/profile_service.dart';
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

    /// Profile
    getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
    getIt.registerFactory<ProfileService>(
      () => ProfileService(apiConsumer: getIt()),
    );

    /// PageContainContent
    getIt.registerLazySingleton<PageContainContentRepo>(
      () => PageContainContentRepo(getIt()),
    );
    getIt.registerFactory<PageContainContentService>(
      () => PageContainContentService(apiConsumer: getIt()),
    );

    /// EditProfile
    getIt.registerLazySingleton<EditProfileRepo>(
      () => EditProfileRepo(getIt()),
    );
    getIt.registerFactory<EditProfileService>(
      () => EditProfileService(apiConsumer: getIt()),
    );

    /// Home
    getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
    getIt.registerFactory<HomeService>(() => HomeService(apiConsumer: getIt()));

    /// Favorite
    getIt.registerLazySingleton<FavoriteRepo>(() => FavoriteRepo(getIt()));
    getIt.registerFactory<FavoriteService>(
      () => FavoriteService(apiConsumer: getIt()),
    );

    /// Booking
    getIt.registerLazySingleton<BookingRepo>(() => BookingRepo(getIt()));
    getIt.registerFactory<BookingService>(
      () => BookingService(apiConsumer: getIt()),
    );

    /// AllCvs
    getIt.registerLazySingleton<AllCvsRepo>(() => AllCvsRepo(getIt()));
    getIt.registerFactory<AllCvsService>(
      () => AllCvsService(apiConsumer: getIt()),
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
