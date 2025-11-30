import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/booking/data/models/get_booking_response_model.dart';
import 'package:mery_comercial_app/features/booking/data/repo/booking_repo.dart';
import 'package:mery_comercial_app/features/booking/logic/booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepo _bookingRepo;

  BookingCubit(this._bookingRepo) : super(InitialState());

  List<BookingModel> booking = [];

  getBooking() {
    booking = [];
    emit(OnGetBookingLoadingState());
    _bookingRepo
        .getBooking()
        .then((value) {
          value.fold(
            (l) {
              emit(OnGetBookingErrorState());
            },
            (r) async {
              booking = r.bookData.bookings;
              emit(OnGetBookingSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnGetBookingCatchErrorState());
        });
  }

  static BookingCubit get(context) => BlocProvider.of(context);
}
