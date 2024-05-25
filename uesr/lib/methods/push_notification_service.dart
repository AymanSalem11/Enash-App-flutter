import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:user11_app/appInfo/app_info.dart';
import 'package:user11_app/global/global_var.dart';
import 'package:http/http.dart' as http;

class PushNotificationService {
  static sendNotificationToSelectedDriver(
      String deviceToken, BuildContext context, String tripID) async {
    // التحقق من وجود قيم صالحة لل serverKeyFCM و deviceToken
    if (serverKeyFCM == null || deviceToken == null) {
      print('serverKeyFCM أو deviceToken غير صالحة');
      return;
    }

    // التحقق من توافر الاتصال بالإنترنت
    if (!await _checkInternetConnection()) {
      print('لا يوجد اتصال بالإنترنت');
      return;
    }

    String dropOffDestinationAddress =
    Provider.of<AppInfo>(context, listen: false)
        .dropOffLocation!
        .placeName
        .toString();
    String pickUpAddress = Provider.of<AppInfo>(context, listen: false)
        .pickUpLocation!
        .placeName
        .toString();

    Map<String, String> headerNotificationMap = {
      "Content-Type": "application/json",
      "Authorization": serverKeyFCM,
    };

    Map titleBodyNotificationMap = {
      "title": "NET TRIP REQUEST from $userName",
      "body":
      "PickUp Location: $pickUpAddress \nDropOff Location: $dropOffDestinationAddress",
    };

    Map dataMapNotification = {
      "click_action": "FLUTTER_NOTIFICATION_CLICK",
      "id": "1",
      "status": "done",
      "tripID": tripID,
    };

    Map bodyNotificationMap = {
      "notification": titleBodyNotificationMap,
      "data": dataMapNotification,
      "priority": "high",
      "to": deviceToken,
    };

    // إرسال الإشعار
    http.Response response = await http.post(
      Uri.parse("https://fcm.googleapis.com/fcm/send"),
      headers: headerNotificationMap,
      body: jsonEncode(bodyNotificationMap),
    );

    // التحقق من رد الخادم
    if (response.statusCode == 200) {
      print('تم إرسال الإشعار بنجاح');
    } else {
      print('حدث خطأ أثناء إرسال الإشعار: ${response.statusCode}');
    }
  }

  static Future<bool> _checkInternetConnection() async {
    // يمكنك استخدام هذه الدالة لفحص اتصال الإنترنت
    // قم بتنفيذ الكود الخاص بك لفحص اتصال الإنترنت هنا
    // يمكنك استخدام مكتبة connectivity لهذا الغرض
    return true; // مؤقتًا، نفترض أن الاتصال بالإنترنت متاح
  }
}
