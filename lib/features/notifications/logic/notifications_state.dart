abstract class NotificationsState {}

class InitialState extends NotificationsState {}


class OnGetNotificationsLoadingState extends NotificationsState {}
class OnGetNotificationsErrorState extends NotificationsState {}
class OnGetNotificationsSuccessState extends NotificationsState {}
class OnGetNotificationsCatchErrorState extends NotificationsState {}

