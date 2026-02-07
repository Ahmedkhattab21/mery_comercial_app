import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/features/booking/data/models/booking_request_model.dart';
import 'package:mery_comercial_app/features/booking/data/repo/booking_repo.dart';
import 'package:mery_comercial_app/features/cv_details/data/models/cv_details_response_model.dart'
    as cvd;
import 'package:mery_comercial_app/features/cv_details/data/repo/cv_details_repo.dart';
import 'package:mery_comercial_app/features/favorite/data/models/add_favorite_request_model.dart';
import 'package:mery_comercial_app/features/favorite/data/repo/favorite_repo.dart';
import 'package:mery_comercial_app/features/notifications/data/repo/notifications_repo.dart';
import 'package:mery_comercial_app/features/notifications/logic/notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo _notificationsRepo;

  NotificationsCubit(this._notificationsRepo)
    : super(InitialState());

  cvd.CV? cvDetailsResponseModel;

  getCvDetails() {
    emit(OnGetNotificationsLoadingState());
    _notificationsRepo
        .cvDetails(1)
        .then((value) {
          value.fold(
            (l) {
              emit(OnGetNotificationsErrorState());
            },
            (r) {
              cvDetailsResponseModel = r.data;
              emit(OnGetNotificationsSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnGetNotificationsCatchErrorState());
        });
  }

  static NotificationsCubit get(context) => BlocProvider.of(context);
}
