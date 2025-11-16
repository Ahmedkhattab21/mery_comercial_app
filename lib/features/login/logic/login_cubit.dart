import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/login/data/models/login_request_model.dart';
import 'package:mery_comercial_app/features/login/data/repo/login_repo.dart';
import 'package:mery_comercial_app/features/login/logic/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(InitialState());

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
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

  login() async {
    emit(OnLoginLoadingState());
    _loginRepo
        .login(
          LoginRequestModel(
            email: emailController.text,
            password: passwordController.text,
          ),
        )
        .then((value) {
          value.fold(
            (l) {
              emit(OnLoginErrorState());
            },
            (r) async {
              // await cashUserData(r.useModel.token);
              emit(OnLoginSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnLoginCatchErrorState());
        });
  }

  Future<void> cashUserData(String token) async {
    await CacheHelper.setSecuredString(ConstantKeys.saveTokenToShared, token);
  }

  static LoginCubit get(context) => BlocProvider.of(context);
}
