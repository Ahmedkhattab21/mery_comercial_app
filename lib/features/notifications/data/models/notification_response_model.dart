class NotificationResponseModel {
  String status;
  String message;
  List<Notifications> data;

  NotificationResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: List<Notifications>.from(
        json['data'].map((item) => Notifications.fromJson(item)),
      ).toList(),
    );
  }
}

class Notifications {
  String date;
  Notification notification;

  Notifications({required this.date, required this.notification});

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return Notifications(
      date: json['created_at'],
      notification: Notification.fromJson(json['notification']),
    );
  }
}

class Notification {
  int id;
  String title;
  String body;

  Notification({required this.id, required this.title, required this.body});

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}
