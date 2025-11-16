// import 'dart:convert';
// import 'dart:io';
//
// import 'package:eventix_app/config/routes/routes.dart';
// import 'package:eventix_app/core/services/cache_helper.dart';
// import 'package:eventix_app/core/services/local_notification_service.dart';
// import 'package:eventix_app/core/utils/constant_keys.dart';
// import 'package:eventix_app/my_app.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
//
// ///init pusher before
// class FirebaseNotificationService {
//   static final _firebaseMessage = FirebaseMessaging.instance;
//
//   static Future<void> init() async {
//     try {
//       await _firebaseMessage.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true,
//       );
//       await getDeviceToken();
//
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         print(' on message  onMessage getInitialMessage onMessage onMessage');
//         debugPrint(
//           "message message Tap on Tap on Tap on Tap onMessage   ${message.data}",
//         );
//         // MyOrdersAdminCubit.get(context).getOrders();
//
//         if (!Platform.isIOS) {
//           LocalNotificationService.showNotification(
//             title: message.notification!.title.toString(),
//             body: message.notification!.body.toString(),
//             payload: message.data.map(
//               (key, value) => MapEntry(key.toString(), value.toString()),
//             ),
//           );
//         }
//       });
//
//       _firebaseMessage.getInitialMessage().then((RemoteMessage? message) async {
//         ///when open app get the
//         print(
//           "message message getInitialMessage getInitialMessage${message?.data}",
//         );
//
//         ///
//         if (message != null) {
//           String? userType = await CacheHelper.getSecuredString(
//             ConstantKeys.saveTypeToShared,
//           );
//           if (userType != null && navigatorKey.currentContext != null) {
//             if (userType == 'client') {
//               Navigator.pushNamed(
//                 navigatorKey.currentContext!,
//                 Routes.notificationScreen,
//                 // arguments: {
//                 //   'id':
//                 //   int.tryParse(
//                 //     receivedAction.payload!['subject_id'].toString(),
//                 //   ) ??
//                 //       0,
//                 //   'isRoom': true,
//                 //   'isNotification': true,
//                 // },
//               );
//               // if (message.data['subject_type'] == 'chatroom') {
//               //   Navigator.pushNamed(
//               //     navigatorKey.currentContext!,
//               //     Routes.chatDetailsScreen,
//               //     arguments: {
//               //       'id':
//               //       int.tryParse(message.data['subject_id'].toString()) ??
//               //           0,
//               //       'isRoom': true,
//               //       'isNotification': true,
//               //     },
//               //   );
//               // } else if (message.data['subject_type'] == 'chatdirect') {
//               //   Navigator.pushNamed(
//               //     navigatorKey.currentContext!,
//               //     Routes.chatDetailsScreen,
//               //     arguments: {
//               //       'id':
//               //       int.tryParse(message.data['subject_id'].toString()) ??
//               //           0,
//               //       'isRoom': false,
//               //       'isNotification': true,
//               //     },
//               //   );
//               // } else if (message.data['subject_type'] == 'Booking') {
//               //   Navigator.pushNamed(
//               //     navigatorKey.currentContext!,
//               //     Routes.userMyBookingScreen,
//               //   );
//               // }
//             } else {
//               Navigator.pushNamed(
//                 navigatorKey.currentContext!,
//                 Routes.notificationScreen,
//                 // arguments: {
//                 //   'id':
//                 //   int.tryParse(
//                 //     receivedAction.payload!['subject_id'].toString(),
//                 //   ) ??
//                 //       0,
//                 //   'isRoom': true,
//                 //   'isNotification': true,
//                 // },
//               );
//               // if (message.data['subject_type'] == 'chatroom') {
//               //   // Navigator.pushNamed(
//               //   //   navigatorKey.currentContext!,
//               //   //   Routes.sponsorButtonNavigationBarSceen,
//               //   // );
//               //   print('--------chatroom--------');
//               //   Navigator.pushNamed(
//               //     navigatorKey.currentContext!,
//               //     Routes.chatDetailsScreen,
//               //     arguments: {
//               //       'id':
//               //       int.tryParse(message.data['subject_id'].toString()) ??
//               //           0,
//               //       'isRoom': true,
//               //       'isNotification': true,
//               //     },
//               //   );
//               // }
//               // else if (message.data['subject_type'] == 'chatdirect') {
//               //   // Navigator.pushNamed(
//               //   //   navigatorKey.currentContext!,
//               //   //   Routes.sponsorButtonNavigationBarSceen,
//               //   // );
//               //   Navigator.pushNamed(
//               //     navigatorKey.currentContext!,
//               //     Routes.chatDetailsScreen,
//               //     arguments: {
//               //       'id':
//               //       int.tryParse(message.data['subject_id'].toString()) ??
//               //           0,
//               //       'isRoom': false,
//               //       'isNotification': true,
//               //     },
//               //   );
//               // }
//               // else if (message.data['subject_type'] == 'Booking') {
//               //   Navigator.pushNamed(
//               //     navigatorKey.currentContext!,
//               //     Routes.sponsorMyBookingScreen,
//               //     arguments: {'isPending': true},
//               //   );
//               // }
//             }
//           }
//         }
//       });
//
//       ///done edit wait for test
//       ///
//       FirebaseMessaging.onMessageOpenedApp.listen((message) async {
//         ///on tap form back ground or foground on ios
//         ///
//         debugPrint(
//           "getInitialMessage Tap on Tap on Tap on Tap onMessageOpenedApp  ${message.data}",
//         );
//
//         if (message != null) {
//           String? userType = await CacheHelper.getSecuredString(
//             ConstantKeys.saveTypeToShared,
//           );
//           if (userType != null && navigatorKey.currentContext != null) {
//             if (userType == 'client') {
//               Navigator.pushNamed(
//                 navigatorKey.currentContext!,
//                 Routes.notificationScreen,
//                 // arguments: {
//                 //   'id':
//                 //   int.tryParse(
//                 //     receivedAction.payload!['subject_id'].toString(),
//                 //   ) ??
//                 //       0,
//                 //   'isRoom': true,
//                 //   'isNotification': true,
//                 // },
//               );
//               // if (message.data['subject_type'] == 'chatroom') {
//               //   Navigator.pushNamed(
//               //     navigatorKey.currentContext!,
//               //     Routes.chatDetailsScreen,
//               //     arguments: {
//               //       'id':
//               //       int.tryParse(message.data['subject_id'].toString()) ??
//               //           0,
//               //       'isRoom': true,
//               //       'isNotification': true,
//               //     },
//               //   );
//               // }
//               // else if (message.data['subject_type'] == 'chatdirect') {
//               //   Navigator.pushNamed(
//               //     navigatorKey.currentContext!,
//               //     Routes.chatDetailsScreen,
//               //     arguments: {
//               //       'id':
//               //       int.tryParse(message.data['subject_id'].toString()) ??
//               //           0,
//               //       'isRoom': false,
//               //       'isNotification': true,
//               //     },
//               //   );
//               // }
//               // else if (message.data['subject_type'] == 'Booking') {
//               //   Navigator.pushNamed(
//               //     navigatorKey.currentContext!,
//               //     Routes.userMyBookingScreen,
//               //   );
//               // }
//             } else {
//               Navigator.pushNamed(
//                 navigatorKey.currentContext!,
//                 Routes.notificationScreen,
//                 // arguments: {
//                 //   'id':
//                 //   int.tryParse(
//                 //     receivedAction.payload!['subject_id'].toString(),
//                 //   ) ??
//                 //       0,
//                 //   'isRoom': true,
//                 //   'isNotification': true,
//                 // },
//               );
//               // if (message.data['subject_type'] == 'chatroom') {
//               //   // Navigator.pushNamed(
//               //   //   navigatorKey.currentContext!,
//               //   //   Routes.sponsorButtonNavigationBarSceen,
//               //   // );
//               //   print('--------chatroom--------');
//               //   Navigator.pushNamed(
//               //     navigatorKey.currentContext!,
//               //     Routes.chatDetailsScreen,
//               //     arguments: {
//               //       'id':
//               //       int.tryParse(message.data['subject_id'].toString()) ??
//               //           0,
//               //       'isRoom': true,
//               //       'isNotification': true,
//               //     },
//               //   );
//               // }
//               // else if (message.data['subject_type'] == 'chatdirect') {
//               //   // Navigator.pushNamed(
//               //   //   navigatorKey.currentContext!,
//               //   //   Routes.sponsorButtonNavigationBarSceen,
//               //   // );
//               //   Navigator.pushNamed(
//               //     navigatorKey.currentContext!,
//               //     Routes.chatDetailsScreen,
//               //     arguments: {
//               //       'id':
//               //       int.tryParse(message.data['subject_id'].toString()) ??
//               //           0,
//               //       'isRoom': false,
//               //       'isNotification': true,
//               //     },
//               //   );
//               // }
//               // else if (message.data['subject_type'] == 'Booking') {
//               //   Navigator.pushNamed(
//               //     navigatorKey.currentContext!,
//               //     Routes.sponsorMyBookingScreen,
//               //     arguments: {'isPending': true},
//               //   );
//               // }
//             }
//           }
//         }
//       });
//     } catch (e) {
//       print('error$e');
//     }
//   }
//
//   static Future<String> getDeviceToken() async {
//     String? token = await _firebaseMessage.getToken();
//     if (token == null) return "";
//     print("token $token");
//     return token;
//   }
// }
