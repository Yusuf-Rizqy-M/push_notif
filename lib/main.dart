import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:push_notif/api/firebase_api.dart';
import 'package:push_notif/pages/notification_page.dart';
import 'firebase_options.dart';
import 'package:push_notif/pages/home_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      navigatorKey: navigatorKey,
      routes:  {
        '/notification_screen': (context) => const NotificationPage(),
      },
    );
  }
}