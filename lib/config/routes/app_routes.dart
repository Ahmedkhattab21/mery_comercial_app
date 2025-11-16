import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/config/routes/routes.dart';
import 'package:mery_comercial_app/core/services/services_locator.dart';
import 'package:mery_comercial_app/features/login/logic/login_cubit.dart';
import 'package:mery_comercial_app/features/login/ui/login_screen.dart';
import 'package:mery_comercial_app/features/register/logic/register_cubit.dart';
import 'package:mery_comercial_app/features/register/ui/register_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {
      // case Routes.splashScreen:
      //   return MaterialPageRoute(builder: (_) => SplashScreen());

      // case Routes.landingPageScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => LandingPageScreen(),
      //   );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(getIt()),
            child: LoginScreen(),
          ),
        );
     case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(getIt()),
            child: RegisterScreen(),
          ),
        );

      // case Routes.sideBarScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => SideBarCubit(),
      //       child: SideBarScreen(),
      //     ),
      //   );

      // case Routes.officeDetailsScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => OfficeDetailsCubit(),
      //       child: OfficeDetailsScreen(),
      //     ),
      //   );

      // case Routes.addNewOfficeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => AddNewOfficeCubit(getIt())..getCites(),
      //       child: AddNewOfficeScreen(),
      //     ),
      //   );



      // case Routes.addNewRoleScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => AddNewRoleCubit(getIt())..getPermissions(),
      //       child: AddNewRoleScreen(),
      //     ),
      //   );
      // case Routes.addNewEmployeeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) =>
      //           AddNewEmployeeCubit(getIt(), getIt())..getRoles(),
      //       child: AddNewEmployeeScreen(),
      //     ),
      //   );
      // case Routes.updateRoleScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => UpdateRoleCubit(getIt(), getIt())
      //         ..getPermissions()
      //         ..getRole(args['id']),
      //       child: UpdateRoleScreen(roleID: args['id']),
      //     ),
      //   );

      ///office
      // case Routes.officeLoginScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => OfficeLoginCubit(getIt()),
      //       child: OfficeLoginScreen(),
      //     ),
      //   );
      // case Routes.officeRegisterScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => OfficeRegisterCubit(getIt())..getCites(),
      //       child: OfficeRegisterScreen(),
      //     ),
      //   );
      // case Routes.officeForgetPasswordScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => OfficeForgetPasswordCubit(getIt()),
      //       child: OfficeForgetPasswordScreen(),
      //     ),
      //   );
      // case Routes.officeReseatPasswordScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => OfficeReseatPasswordCubit(getIt()),
      //       child: OfficeReseatPasswordScreen(email: args['email']),
      //     ),
      //   );

      default:
        return null;
    }
  }
}
