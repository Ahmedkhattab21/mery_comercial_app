import 'package:flutter/material.dart';
import 'package:mery_comercial_app/features/all_cvs/data/models/test_data.dart';
 import 'package:toastification/toastification.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart' as intl;

import 'app_colors_white_theme.dart';

bool isLoggedInUser = false;

class AppConstant {
  static List<TestClass> muslimsList = [
    TestClass(1, 'مسلمة '),
    TestClass(2, 'غير مسلمة'),
  ];
  static List<TestClass> experienceList = [
    TestClass(1, 'لديها خبره '),
    TestClass(2, 'ليس لديها خبره'),
  ];
  // static List<TestClass> activeList = [
  //   TestClass(1, 'مفعل'),
  //   TestClass(2, 'غير مفعل'),
  // ];
  // static List<TestClass> muslimsList = [
  //   TestClass(1, 'مسلمة '),
  //   TestClass(2, 'غير مسلمة'),
  // ];
  // static List<TestClass> experienceList = [
  //   TestClass(1, 'لديها خبره '),
  //   TestClass(2, 'ليس لديها خبره'),
  // ];
  // static List<TestClassLanguage> cvStatusList = [
  //   TestClassLanguage(1, 'معلق', 'pending'),
  //   TestClassLanguage(2, 'مرفوض ', 'rejected'),
  //   TestClassLanguage(3, 'موافق عليه', 'Approved'),
  // ];
  //
  // static List<PaginationClass> pagesList = [
  //   PaginationClass(1, '5'),
  //   PaginationClass(2, '10'),
  //   PaginationClass(3, '15'),
  //   PaginationClass(4, '20'),
  //   PaginationClass(5, '25'),
  //   PaginationClass(6, '30'),
  // ];

  static String name = '';
  static String phone = '';
  static String address = '';
  static String lat = '';
  static String lang = '';
  static String privacy = '';
  static String terms = '';
  static String aboutTitle = '';
  static String about = '';
  static String youtube = '';
  static String x = '';
  static String linkedin = '';
  static String instagram = '';
  static String facebook = '';
  static String imgUrl = '';
  static String ticktock = '';
  static String website = '';
  static String email = '';

  static toast(String message, bool isTrue, BuildContext context) {
    return toastification.show(
      context: context,
      title: Text(message),
      icon: Icon(
        isTrue ? Icons.check_circle_outline_rounded : Icons.close,
        color: isTrue ? AppColors.greenColor31 : AppColors.redColor20,
      ),
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

  static double getProductPriceAfterDiscount(
    String discountType,
    double productPrice,
    double discount,
  ) {
    if (discountType == "percent") {
      return productPrice - (discount * productPrice) / 100;
    } else {
      return productPrice - discount;
    }
  }

  static double getDiscountOnProduct(
    String discountType,
    double productPrice,
    double discount,
  ) {
    if (discountType == "percent") {
      return (discount * productPrice) / 100;
    } else {
      return discount;
    }
  }

  static String confirmRoundTo3Numbers(double number) {
    return number.toStringAsFixed(3);
  }

  static Map<String, int> requestsType = {
    "orders_from_manager": 0,
    "my_orders": 1,
    "leave_orders": 2,
  };

  static void openUrl(String webUrl) async {
    final String url = webUrl;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw "Could not launch $url";
    }
  }

  // static void openUrl(String webUrl) async {
  //   final String url = webUrl;
  //   if (await canLaunchUrl(Uri.parse(url))) {
  //     await launchUrl(Uri.parse(url));
  //   } else {
  //     throw "Could not launch $url";
  //   }
  // }

  static String convertMonth(String monthNumber) {
    Map<String, String> months = {
      "01": "Jan",
      "02": "Feb",
      "03": "Mar",
      "04": "Apr",
      "05": "May",
      "06": "Jun",
      "07": "Jul",
      "08": "Aug",
      "09": "Sep",
      "10": "Oct",
      "11": "Nov",
      "12": "Dec",
    };

    return months[monthNumber] ?? "";
  }

  static String to24Hour(String time) {
    if (time.toUpperCase().contains("AM") ||
        time.toUpperCase().contains("PM")) {
      // فصل الساعة والدقايق عن AM/PM
      final parts = time.split(" ");
      final hm = parts[0].split(":");
      int hour = int.parse(hm[0]);
      int minute = hm.length > 1 ? int.parse(hm[1]) : 0;
      String meridian = parts[1].toUpperCase();

      if (meridian == "AM") {
        if (hour == 12) hour = 0; // 12 AM = 00
      } else {
        if (hour != 12) hour += 12; // غير 12 PM
      }

      return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
    } else {
      if (time.contains(":")) {
        final parts = time.split(":");
        if (parts.length >= 2) {
          return "${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}";
        }
      }
    }

    // لو أصلاً 24 ساعة، رجعه زي ما هو
    return time;
  }

  static String normalizeDate(String input) {
    try {
      if (input.contains("/")) {
        return input.replaceAll('/', '-');
      } else if (input.contains("-")) {
        return input;
      } else {
        return input; // Unknown format, return as is
      }
    } catch (e) {
      return input; // If parsing fails, return as is
    }
  }

  static int daysUntilEvent(String eventDateStr) {
    // parse string to DateTime
    DateTime eventDate = DateTime.parse(eventDateStr);

    // get today's date (without time for accurate day difference)
    DateTime today = DateTime.now();
    DateTime todayOnly = DateTime(today.year, today.month, today.day);

    // calculate difference
    Duration difference = eventDate.difference(todayOnly);

    return difference.inDays;
  }

  static String formatDateRange(DateTime startDate, DateTime endDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(Duration(days: 1));
    final startDateOnly = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
    );

    String dayText;
    if (startDateOnly == today) {
      dayText = "Today";
    } else if (startDateOnly == tomorrow) {
      dayText = "Tomorrow";
    } else {
      dayText = intl.DateFormat.EEEE().format(
        startDate,
      ); // Example: Monday, Tuesday
    }

    String startTime = intl.DateFormat.Hm().format(startDate); // 18:00
    String endTime = intl.DateFormat.Hm().format(endDate); // 18:30

    return "$dayText $startTime - $endTime";
  }

  // static String getMonthName(int monthNumber) {
  //    if (monthNumber < 1 || monthNumber > 12) {
  //      return 'Invalid month';
  //    }
  //
  //    List<String> monthNames = [
  //      'January', 'February', 'March', 'April', 'May', 'June',
  //      'July', 'August', 'September', 'October', 'November', 'December'
  //    ];
  //
  //    return monthNames[monthNumber - 1];
  //  }
  //
  // static void openUrl(String webUrl) async {
  //   final String url = webUrl;
  //   if (await canLaunchUrl(Uri.parse(url))) {
  //     await launchUrl(Uri.parse(url));
  //   } else {
  //     throw "Could not launch $url";
  //   }
  // }

  static Future<void> openWhatsApp(String phone, {String? message}) async {
    final String encodedMessage = Uri.encodeComponent(message ?? "");
    final Uri whatsappUrl = Uri.parse(
      "https://wa.me/$phone?text=$encodedMessage",
    );

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not open WhatsApp.";
    }
  }

  static Future<void> openMap(double latitude, double longitude) async {
    final googleUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );

    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open the map.';
    }
  }

  // static Future<String> getLocationFromCoordinates(
  //   double latitude,
  //   double longitude,
  // ) async {
  //   try {
  //     if (latitude != 0 && longitude != 0) {
  //       List<Placemark> placeMarks = await placemarkFromCoordinates(
  //         latitude,
  //         longitude,
  //       );
  //       if (placeMarks != null && placeMarks.isNotEmpty) {
  //         Placemark placeMark = placeMarks[0];
  //         String address =
  //             // '${placeMark.thoroughfare} ,'
  //             ' ${placeMark.administrativeArea!.replaceAll("Governorate", "")},${placeMark.country!}';
  //         return address;
  //       }
  //     }
  //   } catch (e) {
  //     return "";
  //     // print('Error retrieving location: $e');
  //   }
  //   return "";
  //   // return 'Location not found';
  // }

  // static String getDistance(
  //   Position? position1,
  //   String latitude,
  //   String longitude,
  // ) {
  //   double distanceInMeters = Geolocator.distanceBetween(
  //     position1?.latitude ?? 0,
  //     position1?.longitude ?? 0,
  //     double.tryParse(latitude) ?? 0,
  //     double.tryParse(longitude) ?? 0,
  //   );
  //   if (distanceInMeters > 1000) {
  //     return "${(distanceInMeters / 1000).toStringAsFixed(2)} km";
  //   } else {
  //     return "${(distanceInMeters).toStringAsFixed(2)}m";
  //   }
  // }
}
