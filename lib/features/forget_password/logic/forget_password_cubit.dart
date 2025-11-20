import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/forget_password/data/models/forget_password_request_model.dart';
import 'package:mery_comercial_app/features/forget_password/data/repo/forget_password_repo.dart';
import 'package:mery_comercial_app/features/forget_password/logic/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo _forgetPasswordRepo;

  ForgetPasswordCubit(this._forgetPasswordRepo) : super(InitialState());

  GlobalKey<FormState> cubitKey = GlobalKey<FormState>();
  TextEditingController nationalIdController = TextEditingController();

  forgetPassword() async {
    emit(OnForgetPasswordLoadingState());
    _forgetPasswordRepo
        .forgetPassword(
          ForgetPasswordRequestModel(nationalId: nationalIdController.text),
        )
        .then((value) {
          value.fold(
            (l) {
              emit(OnForgetPasswordErrorState(message: l.message));
            },
            (r) {
              emit(OnForgetPasswordSuccessState(message: r.tokenModel.token));
            },
          );
        })
        .catchError((error) {
          emit(
            OnForgetPasswordCatchErrorState(message: error.message.toString()),
          );
        });
  }

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
}
