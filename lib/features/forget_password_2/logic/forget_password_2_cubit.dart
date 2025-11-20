import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/forget_password_2/data/models/forget_password_2_request_model.dart';
import 'package:mery_comercial_app/features/forget_password_2/data/repo/forget_password_2_repo.dart';
import 'package:mery_comercial_app/features/forget_password_2/logic/forget_password_2_state.dart';

class ForgetPassword2Cubit extends Cubit<ForgetPassword2State> {
  final ForgetPassword2Repo _forgetPassword2Repo;

  ForgetPassword2Cubit(this._forgetPassword2Repo) : super(InitialState());

  GlobalKey<FormState> cubitKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  forgetPassword(String token) async {
    emit(OnForgetPasswordLoadingState());
    _forgetPassword2Repo
        .forgetPassword(
          ForgetPassword2RequestModel(
            token: token,
            phone: phoneController.text,
          ),
        )
        .then((value) {
          value.fold(
            (l) {
              emit(OnForgetPasswordErrorState(message: l.message));
            },
            (r) {
              emit(
                OnForgetPasswordSuccessState(message: r.tokenModel.resetToken),
              );
            },
          );
        })
        .catchError((error) {
          emit(
            OnForgetPasswordCatchErrorState(message: error.message.toString()),
          );
        });
  }

  static ForgetPassword2Cubit get(context) => BlocProvider.of(context);
}
