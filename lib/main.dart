import 'package:flutter/material.dart';
import 'package:myproject/pages/bottomandscoffold.dart';
import 'package:firebase_core/firebase_core.dart';

import 'LoginFireBase/until.dart';
import 'Starting.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp( theme: ThemeData(
      primarySwatch: Colors.purple,
    ),

        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
scaffoldMessengerKey: Utils.messengerKey,
        home: FirstScreen());
  }
}
