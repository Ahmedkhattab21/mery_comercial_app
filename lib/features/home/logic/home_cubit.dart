import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/home/data/models/get_cvs_response_model.dart'
    as cv;
import 'package:mery_comercial_app/features/home/data/models/get_nationality_response_model.dart'
    as nationality;
import 'package:mery_comercial_app/features/home/data/repo/home_repo.dart';
import 'package:mery_comercial_app/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(InitialState());

  List<nationality.Nationality> nationalities = [];
  getNationality() {
    emit(OnGetNationalityLoadingState());
    _homeRepo
        .getNationality()
        .then((value) {
          value.fold(
            (l) {
              emit(OnGetNationalityErrorState());
            },
            (r) async {
              nationalities = r.data;
              emit(OnGetNationalitySuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnGetNationalityCatchErrorState());
        });
  }

  List<cv.CV> cvs = [];
  getCV() {
    emit(OnGetCVSLoadingState());
    _homeRepo
        .getCV()
        .then((value) {
          value.fold(
            (l) {
              emit(OnGetCVSErrorState());
            },
            (r) async {
              cvs = r.data;
              emit(OnGetCVSSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnGetCVSCatchErrorState());
        });
  }

  static HomeCubit get(context) => BlocProvider.of(context);
}
