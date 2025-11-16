import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_dashboard/features/office/office_auth/office_forget_password/data/models/forget_password_request_model.dart';
import 'package:mery_dashboard/features/office/office_auth/office_forget_password/data/repo/forget_password_repo.dart';
import 'package:mery_dashboard/features/office/office_auth/office_forget_password/logic/forget_password_state.dart';

class OfficeForgetPasswordCubit extends Cubit<OfficeForgetPasswordState> {
  final OfficeForgetPasswordRepo _officeForgetPasswordRepo;

  OfficeForgetPasswordCubit(this._officeForgetPasswordRepo)
    : super(InitialState());

  GlobalKey<FormState> cubitKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  forgetPassword() async {
    emit(OnForgetPasswordLoadingState());
    _officeForgetPasswordRepo
        .forgetPassword(
          OfficeForgetPasswordRequestModel(email: emailController.text),
        )
        .then((value) {
          value.fold(
            (l) {
              emit(OnForgetPasswordErrorState(message: l.message));
            },
            (r) async {
              // await cashUserData(r.useModel.token);
              emit(OnForgetPasswordSuccessState(message: r.message??''));
            },
          );
        })
        .catchError((error) {
          emit(
            OnForgetPasswordCatchErrorState(message: error.message.toString()),
          );
        });
  }

  // Future<void> cashUserData(String token) async {
  //   await CacheHelper.setSecuredString(ConstantKeys.saveTokenToShared, token);
  // }

  static OfficeForgetPasswordCubit get(context) => BlocProvider.of(context);
}
