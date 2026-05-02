import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/categories/data/models/categories_response_model.dart';
import 'package:mery_comercial_app/features/categories/data/repo/categories_repo.dart';
import 'package:mery_comercial_app/features/categories/logic/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo _categoriesRepo;

  CategoriesCubit(this._categoriesRepo) : super(CategoriesInitialState());

  List<Category> categories = [];

  void getCategories() {
    categories = [];
    emit(OnGetCategoriesLoadingState());
    _categoriesRepo
        .getCategories()
        .then((value) {
          if (isClosed) return;
          value.fold(
            (l) => emit(OnGetCategoriesErrorState()),
            (r) {
              categories = r.data;
              emit(OnGetCategoriesSuccessState());
            },
          );
        })
        .catchError((_) { if (!isClosed) emit(OnGetCategoriesCatchErrorState()); });
  }

  static CategoriesCubit get(context) => BlocProvider.of(context);
}
