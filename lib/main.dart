import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ujob/Admob/AdmobHelper.dart';
import 'package:ujob/FirebaseHelper.dart';
import 'package:ujob/LoginPage/splash.dart';
import 'package:ujob/LoginPage/usermodel.dart';
import 'Admob/ads_page.dart';
import 'LoginPage/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobHelper.initialize();
  await Firebase.initializeApp();

  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    // Logged In
    UserModel? thisUserModel =
        await FirebaseHelper.getUserModelById(currentUser.uid);
    if (thisUserModel != null) {
      runApp(
          MyAppLoggedIn(userModel: thisUserModel, firebaseUser: currentUser));
    } else {
      runApp(MyApp());
    }
  } else {
    // Not logged in
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                    child: Text(
                  'ujob is Here for you',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'medium'),
                )),
              ),
            );
          } else if (snapshot.hasError) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                    child: Text(
                  'as error has been occured',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'uJob',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.black,
              primarySwatch: Colors.blue,
            ),
            home: ads_Page(),
          );
        });
  }
}

class MyAppLoggedIn extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;

  const MyAppLoggedIn(
      {Key? key, required this.userModel, required this.firebaseUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(userModel: userModel, firebaseUser: firebaseUser),
    );
  }
}
