abstract class BookingState {}

class InitialState extends BookingState {}

class OnGetBookingLoadingState extends BookingState {}
class OnGetBookingErrorState extends BookingState {}
class OnGetBookingSuccessState extends BookingState {}
class OnGetBookingCatchErrorState extends BookingState {}

