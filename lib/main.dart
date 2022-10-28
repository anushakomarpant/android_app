import 'package:android_app/dashboard/dashboard.dart';
import 'package:android_app/dashboard/ifb.dart';
import 'package:android_app/dashboard/myapi.dart';
import 'package:android_app/log_in/register.dart';
import 'package:android_app/log_in_screen.dart';
import 'package:android_app/password_login/first_screen.dart';
import 'package:android_app/password_login/login_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:android_app/home/main_home_page.dart';
import 'package:android_app/popular_services_details.dart';
import 'package:android_app/utils/colors.dart';
import 'package:android_app/stores.dart';
import 'package:android_app/grid_view.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:charts_flutter/flutter.dart' as charts;
/*
void main() {
  runApp(const MyApp());
}

 */
//below code for firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        //scaffoldBackgroundColor: AppColors.backgroundColor,
      ),

      //home: const MainHomePage(),
      //home: const PopularServicesDetails(),
      //home: const Stores(),
        //home: const Register(),
      //home: LoginScreen(),
      //home: LoginScreenWithPassword(),
      home:  const FirstScreen(),
        //home:  DashBoard(products: fetchProducts()),
      // home:  DashBoard(),
        //home: IFBMyApi(),
        //home: const StoresGridView(),
    );
  }
}
