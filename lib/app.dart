import 'package:flutter/material.dart';
import 'dfz.dart';

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
// AndroidNotificationChannel? channel;

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //
  // void initState(){
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     PushNotification(
  //       title: message.notification?.title,
  //       body: message.notification?.body,
  //     );
  //   });
  //   super.initState();
  //   registerNotification();
  // }
  // late final FirebaseMessaging _messaging;
  // void registerNotification() async {
  //
  //   // 1. Initialize the Firebase app
  //   await Firebase.initializeApp();
  //
  //   // 2. Instantiate Firebase Messaging
  //   _messaging = FirebaseMessaging.instance;
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //   // FirebaseMessaging.onMessage.listen((RemoteMessage) { });
  //   // 3. On iOS, this helps to take the user permissions
  //   NotificationSettings settings = await _messaging.requestPermission(
  //     alert: true,
  //     badge: true,
  //     provisional: false,
  //     sound: true,
  //   );
  //
  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     print('User granted permission');
  //
  //     // For handling the received notifications
  //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //       RemoteNotification? notification = message.notification;
  //       AndroidNotification? androidNotification = message.notification?.android;
  //
  //       if(notification!=null && androidNotification!=null){
  //         flutterLocalNotificationsPlugin.show(notification.hashCode,
  //           notification.title, notification.body,NotificationDetails(
  //             android: AndroidNotificationDetails(
  //               "${channel?.id}",
  //               "${channel?.name}",
  //               icon: '@mipmap/ic_launcher',
  //             ),
  //           ),);
  //
  //         Fluttertoast.showToast(
  //             msg: "${notification.title}\n${notification.body}",
  //             toastLength: Toast.LENGTH_LONG,
  //             gravity: ToastGravity.TOP,
  //             timeInSecForIosWeb: 30,
  //             backgroundColor: Colors.black,
  //             textColor: Colors.white,
  //             fontSize: 12.0
  //         );
  //       }
  //       print(notification?.title);
  //       // Parse the message received
  //       PushNotification(
  //         title: message.notification?.title,
  //         body: message.notification?.body,
  //       );
  //     });
  //   } else {
  //     print('User declined or has not accepted permission');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home:  const SplashPage(),
        //  home: const HomePage(),

    );
  }
}

//
// class PushNotification {
//   PushNotification({
//     this.title,
//     this.body,
//   });
//   String? title;
//   String? body;
// }
// Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message: ${message.messageId}");
// }