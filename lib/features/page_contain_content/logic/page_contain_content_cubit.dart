import 'package:image_picker/image_picker.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/page_contain_content/data/repo/page_contain_content_repo.dart';
import 'package:mery_comercial_app/features/page_contain_content/logic/page_contain_content_state.dart';

class PageContainContentCubit extends Cubit<PageContainContentState> {
  final PageContainContentRepo _pageContainContentRepo;

  PageContainContentCubit(this._pageContainContentRepo) : super(InitialState());
  pages(int id) {
    emit(OnGetPagesLoadingState());
    _pageContainContentRepo
        .pages(id)
        .then((value) {
          value.fold(
            (l) {
              emit(OnGetPagesErrorState());
            },
            (r) {
              emit(OnGetPagesSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnGetPagesCatchErrorState());
        });
  }

  static PageContainContentCubit get(context) => BlocProvider.of(context);
}
