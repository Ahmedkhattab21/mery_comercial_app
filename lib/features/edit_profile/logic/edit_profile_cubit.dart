import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/edit_profile/data/models/update_user_data_request_model.dart';
import 'package:mery_comercial_app/features/edit_profile/data/repo/edit_profile_repo.dart';
import 'package:mery_comercial_app/features/edit_profile/logic/edit_profile_state.dart';
import 'package:mery_comercial_app/features/profile/data/repo/profile_repo.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepo _editProfileRepo;
  final ProfileRepo _profileRepo;

  EditProfileCubit(this._editProfileRepo, this._profileRepo)
    : super(InitialState());

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  getUSerData() {
    emit(OnGetUSerDataLoadingState());
    _editProfileRepo
        .getUserData()
        .then((value) {
          value.fold(
            (l) {
              emit(OnGetUSerDataErrorState());
            },
            (r) {
              nameController.text = r.data.name;
              phoneController.text = r.data.phone;
              nationalIDController.text = r.data.nationalId;
              emit(OnGetUSerDataSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnGetUSerDataCatchErrorState());
        });
  }

  updateProfile() {
    emit(OnUpdateProfileLoadingState());
    _editProfileRepo
        .updateProfile(
          UpdateUserDataRequestModel(
            name: nameController.text,
            phone: phoneController.text,
          ),
        )
        .then((value) {
          value.fold(
            (l) {
              emit(OnUpdateProfileErrorState(message: l.message.toString()));
            },
            (r) async {
              emit(OnUpdateProfileSuccessState(message: r.message.toString()));
            },
          );
        })
        .catchError((error) {
          emit(
            OnUpdateProfileCatchErrorState(message: error.message.toString()),
          );
        });
  }

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

  Future<void> cashUserData(String token, String name) async {
    await CacheHelper.setSecuredString(ConstantKeys.saveTokenToShared, token);
    // await CacheHelper.setSecuredString(ConstantKeys.saveNameToShared, name);
  }

  static EditProfileCubit get(context) => BlocProvider.of(context);
}
