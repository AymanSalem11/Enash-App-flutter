import 'package:enash/pages/dashboard.dart';
import 'package:enash/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


import 'authentication/login_screen.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey:
            "AIzaSyBEqOzBywlTxKj1xUR_xZkgKoUJr8FDWtk", // paste your api key here
            appId:
            "1:264163967860:android:a1ecb24a9c43c1261d2221", //paste your app id here
            messagingSenderId:  "160254124355", //paste your messagingSenderId here
            projectId:"t-enash" ,//paste your project id here
            storageBucket: "t-enash.appspot.com",
        )
    );
    await Permission.locationWhenInUse.isDenied.then((valueOfPermission)
    {
      if(valueOfPermission)
      {
        Permission.locationWhenInUse.request();
      }
    });

    await Permission.notification.isDenied.then((valueOfPermission)
    {
      if(valueOfPermission)
      {
        Permission.notification.request();
      }
    });

    runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Drivers App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: FirebaseAuth.instance.currentUser == null ? LoginScreen() : Dashboard(),
    );
  }
}