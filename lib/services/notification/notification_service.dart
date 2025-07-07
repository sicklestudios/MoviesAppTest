// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'dart:math' as math;
// import 'package:http/http.dart' as http;
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   static math.Random random = math.Random();
//   static int notificationId = 0;
//   static final FlutterLocalNotificationsPlugin
//       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   //initalizing the notifications
//   static void initialize() {
//     requestIOSPermissions();
//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: AndroidInitializationSettings("@mipmap/ic_launcher"),
//             iOS: DarwinInitializationSettings(
//               requestSoundPermission: true,
//               requestBadgePermission: true,
//               requestAlertPermission: true,
//             )
//             // iOS: IOSInitializationSettings(
//             // requestSoundPermission: true,
//             // requestBadgePermission: false,
//             // requestAlertPermission: true,
//             // )
//             );

//     _flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       // onSelectNotification: onSelectNotification
//     );
//   }

//   static onSelectNotification(String? payload) async {
//     //Navigate to wherever you want
//   }
//   static requestIOSPermissions() {
//     if (Platform.isIOS) {
//       _flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               IOSFlutterLocalNotificationsPlugin>()
//           ?.requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//           );
//     }
//   }

//   //for showing the notification
//   static Future<void> display(RemoteMessage message) async {
//     if (message.notification != null) {
//       log("Showing notifcation");
//       try {
//         // if()
//         // notificationId=random.nextInt(1000);
//         await _flutterLocalNotificationsPlugin.cancelAll();

//         const NotificationDetails notificationDetails = NotificationDetails(
//           android: AndroidNotificationDetails(
//             "mychanel",
//             "my chanel",
//             // visibility: NotificationVisibility.public,
//             importance: Importance.min,
//             // groupKey: "group",
//             // styleInformation: ,
//             // setAsGroupSummary: true,
//             priority: Priority.min,
//           ),
//           iOS: DarwinNotificationDetails(
//             threadIdentifier: "thread1",
//           ),
//           // iOS: IOSNotificationDetails(
//           //   threadIdentifier: "thread1",
//           // )
//         );
//         // print("my id is ${id.toString()}");
//         await _flutterLocalNotificationsPlugin.show(
//           notificationId,
//           message.notification!.title,
//           message.notification!.body,
//           notificationDetails,
//         );
//       } on Exception catch (e) {
//         log(e.toString());
//       }
//     } else {
//       print("Notifiation is null");
//     }
//   }

//   static Future<void> sendNotificationToToken(
//       String fcmToken, String title, String body) async {
//     // Define your FCM server key obtained from Firebase Console
//     String serverKey =
//         "AAAAxp11j7U:APA91bFUb5fl3l3Fn30mll0YM3dvLrI1h1XSRgmkQ9suvWztuV3qdEg6ZbQ87ZR1rx6aZ2ZImjHVLwL6qhpF34r6KewJUjuCRQqHaR9UGI2Z6XSETCE8AhZ4AjFpRwsZVPcMnh-9Fbkq";

//     // Define the FCM endpoint
//     const String fcmEndpoint = 'https://fcm.googleapis.com/fcm/send';

//     // Create a payload for the notification
//     final Map<String, dynamic> notificationData = {
//       'to': fcmToken,
//       'notification': {
//         'title': title,
//         'body': body,
//         'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//       },
//     };

//     // Convert the payload to JSON
//     final String jsonBody = jsonEncode(notificationData);

//     // Define headers
//     final Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'key=$serverKey',
//     };

//     try {
//       // Send the notification request to FCM
//       final http.Response response = await http.post(
//         Uri.parse(fcmEndpoint),
//         headers: headers,
//         body: jsonBody,
//       );

//       // Check the response status code
//       if (response.statusCode == 200) {
//         print('Notification sent successfully to token: $fcmToken');
//       } else {
//         print(
//             'Failed to send notification. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error sending notification: $e');
//     }
//   }
// }
