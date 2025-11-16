import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/register/data/models/register_request_model.dart';
import 'package:mery_comercial_app/features/register/data/repo/register_repo.dart';
import 'package:mery_comercial_app/features/register/logic/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(InitialState());

  GlobalKey<FormState> cubitKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  changePasswordState() {
    isPasswordVisible = !isPasswordVisible;
    emit(IsPasswordVisibleState());
  }

  bool isSelectForgetMe = true;
  changeForgetMe() {
    isSelectForgetMe = !isSelectForgetMe;
    emit(OnChangeForgetMeState());
  }

  register() async {
    emit(OnRegisterLoadingState());
    _registerRepo
        .register(
          RegisterRequestModel(
            nationalId: nationalIDController.text,
            name: nameController.text,
            phone: phoneController.text,
            password: passwordController.text,
          ),
        )
        .then((value) {
          value.fold(
            (l) {
              emit(OnRegisterErrorState(message: l.message));
            },
            (r) async {
              await cashUserData(r.useModel.token);
              emit(OnRegisterSuccessState(message: r.message));
            },
          );
        })
        .catchError((error) {
          emit(OnRegisterCatchErrorState(message: error.message.toString()));
        });
  }

  Future<void> cashUserData(String token) async {
    await CacheHelper.setSecuredString(ConstantKeys.saveTokenToShared, token);
  }

  static RegisterCubit get(context) => BlocProvider.of(context);
}
