import 'package:image_picker/image_picker.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/page_contain_content/data/repo/page_contain_content_repo.dart';
import 'package:mery_comercial_app/features/page_contain_content/logic/page_contain_content_state.dart';

class PageContainContentCubit extends Cubit<PageContainContentState> {
  final PageContainContentRepo _pageContainContentRepo;

  PageContainContentCubit(this._pageContainContentRepo,  ) : super(InitialState());
  // UserData? profileInfoModel;
  // profileInfo(bool isClient) {
  //   emit(OnProfileInfoLoadingState());
  //   _editProfileRepo
  //       .getUserData(isClient)
  //       .then((value) {
  //     value.fold(
  //           (l) {
  //         emit(OnProfileInfoErrorState());
  //       },
  //           (r) {
  //             print(r.data.img);
  //         profileInfoModel = r.data;
  //         emit(OnProfileInfoSuccessState());
  //       },
  //     );
  //   })
  //       .catchError((error) {
  //     emit(OnProfileInfoCatchErrorState());
  //   });
  // }
  //
  // logOut() {
  //   emit(OnLogOutLoadingState());
  //   _profileRepo
  //       .logOut()
  //       .then((value) {
  //         value.fold(
  //           (l) {
  //             emit(OnLogOutErrorState());
  //           },
  //           (r) {
  //             emit(OnLogOutSuccessState());
  //           },
  //         );
  //       })
  //       .catchError((error) {
  //         emit(OnLogOutCatchErrorState());
  //       });
  // }
  //
  // String? selectedImagePath;
  //
  // uploadImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     selectedImagePath = image.path;
  //     editProfileImage();
  //     emit(OnChangeSelectedImageState());
  //   }
  // }
  //
  // editProfileImage() {
  //   emit(OnEditProfileLoadingState());
  //   _profileRepo
  //       .updateImage(UpdateImageRequestModel(image: selectedImagePath!))
  //       .then((value) {
  //         value.fold(
  //           (l) {
  //             emit(OnEditProfileErrorState());
  //           },
  //           (r) {
  //             emit(OnEditProfileSuccessState());
  //           },
  //         );
  //       })
  //       .catchError((error) {
  //         emit(OnEditProfileCatchErrorState());
  //       });
  // }

  static PageContainContentCubit get(context) => BlocProvider.of(context);
}
