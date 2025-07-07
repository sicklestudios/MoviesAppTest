// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:mapx/services/notification/notification_service.dart';

// class FcmService {
//   @pragma('vm:entry-point')
//   static Future<void> firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     print('Handling a background message');
//     await Firebase.initializeApp(
//         // name: "noti",
//         // options: DefaultFirebaseOptions.currentPlatform,
//         );

//     await showFlutterNotification(message);
//   }

//   static Future<void> showFlutterNotification(RemoteMessage message) async {
//     NotificationService.display(message);
//   }

//   static Future<void> forgroundnotify() async {
//     //await FlutterRingtonePlayer.stop();
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       NotificationService.display(message);
//       print('Got a message whilst in the foreground!');
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       NotificationService.display(message);
//     });

//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) async {
//       if (message != null) {
//         NotificationService.display(message);
//       }
//     });
//   }

//   static onSelectNotification(payload) async {}
// }
