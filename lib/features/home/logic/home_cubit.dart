
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  // final ProfileRepo _profileRepo;
  // final EditProfileRepo _editProfileRepo;

  HomeCubit( ) : super(InitialState());



  static HomeCubit get(context) => BlocProvider.of(context);
}
