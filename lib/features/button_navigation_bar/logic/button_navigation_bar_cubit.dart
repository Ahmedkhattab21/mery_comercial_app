import 'package:mery_comercial_app/core/services/services_locator.dart';
import 'package:mery_comercial_app/core/utils/assets_manager.dart';
import 'package:mery_comercial_app/features/button_navigation_bar/logic/button_navigation_bar_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/button_navigation_bar/models/buttom_model.dart';
import 'package:mery_comercial_app/features/home/logic/home_cubit.dart';
import 'package:mery_comercial_app/features/home/ui/home_screen.dart';
import 'package:mery_comercial_app/features/profile/logic/profile_cubit.dart';
import 'package:mery_comercial_app/features/profile/ui/profile_screen.dart';

class ButtonNavigationBarCubit extends Cubit<ButtonNavigationBarState> {
  ButtonNavigationBarCubit() : super(InitialState());
  int currentIndex = 0;

  final List<ButtonModel> items = [
    ButtonModel(
      id: 1,
      image: ImageAsset.homeIcon,
      selectedImage: ImageAsset.selectedHomeIcon,
      text: 'الرئيسية',
    ),
    ButtonModel(
      id: 2,
      image: ImageAsset.favoriteIcon,
      selectedImage: ImageAsset.selectedFavoriteIcon,
      text: 'المفضلة',
    ),
    ButtonModel(
      id: 3,
      image: ImageAsset.orderIcon,
      selectedImage: ImageAsset.selectedOrderIcon,
      text: 'الطلبات',
    ),
    ButtonModel(
      id: 4,
      image: ImageAsset.profileIcon,
      selectedImage: ImageAsset.selectedProfileIcon,
      text: 'البروفايل',
    ),
  ];

  void changeIndex(int i) {
    currentIndex = i;
    emit(OnBottomNavBarChangedState());
  }

  Widget buttonBarBody() {
    switch (currentIndex) {
      case 0:
        return BlocProvider(
          create: (context) => HomeCubit(getIt())..getNationality()..getCV(),
          child: HomeScreen(),
        );
      case 1:
        return SizedBox();
      case 3:
        return BlocProvider(
          create: (_) => ProfileCubit(getIt()),
          child: ProfileScreen(),
        );

      default:
        return SizedBox();
      // case 0:
      //   return BlocProvider(
      //     create: (_) => HomeCubit(getIt())
      //       ..fetchSponsorCategory()
      //       ..fetchSpeakers()
      //       ..getSponsors()
      //       ..fetchSpecialGuests1()
      //       ..fetchSpecialGuests2()
      //       ..fetchEventData(true)
      //       ..getInfluencers()
      //       ..getPackages()
      //       ..home()
      //       ..fetchBlogs(),
      //     child: HomeScreen(isClient: true, ),
      //   );
      // case 1:
      //   return BlocProvider(
      //     create: (_) => ScheduleCubit(getIt())..getSchedule(),
      //     child: ScheduleScreen(),
      //   );
      // case 2:
      //   return BlocProvider(
      //     create: (context) => UserMyBookingCubit(getIt()),
      //     child: UserMyBookingScreen(),
      //   );

      // );

      // default:
      //   return BlocProvider(
      //     create: (_) => HomeCubit(getIt()),
      //     child: HomeScreen(isClient: true, ),
      //   );
    }
  }

  static ButtonNavigationBarCubit get(context) => BlocProvider.of(context);
}
