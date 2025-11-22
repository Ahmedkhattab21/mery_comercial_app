import 'package:image_picker/image_picker.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/profile/data/repo/profile_repo.dart';
import 'package:mery_comercial_app/features/profile/logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  // final EditProfileRepo _editProfileRepo;

  ProfileCubit(this._profileRepo,  ) : super(InitialState());
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

  static ProfileCubit get(context) => BlocProvider.of(context);
}
