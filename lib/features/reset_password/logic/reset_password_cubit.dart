import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/reset_password/data/models/reset_password_request_model.dart';
import 'package:mery_comercial_app/features/reset_password/data/repo/reset_password_repo.dart';
import 'package:mery_comercial_app/features/reset_password/logic/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo _resetPasswordRepo;

  ResetPasswordCubit(this._resetPasswordRepo) : super(InitialState());

  GlobalKey<FormState> cubitKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  changePasswordState() {
    isPasswordVisible = !isPasswordVisible;
    emit(IsPasswordVisibleState());
  }

  resetPassword(String token) async {
    emit(OnResetPasswordLoadingState());
    _resetPasswordRepo
        .resetPassword(
          ResetPasswordRequestModel(
            token: token,
            password: passwordController.text,
          ),
        )
        .then((value) {
          value.fold(
            (l) {
              emit(OnResetPasswordErrorState(message: l.message));
            },
            (r) {
              emit(OnResetPasswordSuccessState(message: r.message ?? ''));
            },
          );
        })
        .catchError((error) {
          emit(
            OnResetPasswordCatchErrorState(message: error.message.toString()),
          );
        });
  }

  static ResetPasswordCubit get(context) => BlocProvider.of(context);
}
