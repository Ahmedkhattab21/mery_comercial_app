import 'package:image_picker/image_picker.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/profile/data/repo/profile_repo.dart';
import 'package:mery_comercial_app/features/profile/logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileCubit(this._profileRepo) : super(InitialState());

  logOut() {
    emit(OnLogOutLoadingState());
    _profileRepo
        .logOut()
        .then((value) {
          value.fold(
            (l) {
              emit(OnLogOutErrorState());
            },
            (r) {
              emit(OnLogOutSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnLogOutCatchErrorState());
        });
  }

  static ProfileCubit get(context) => BlocProvider.of(context);
}
