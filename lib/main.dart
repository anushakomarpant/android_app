import 'package:flutter/material.dart';
import 'package:android_app/home/main_home_page.dart';
import 'package:android_app/popular_services_details.dart';
import 'package:android_app/utils/colors.dart';
import 'package:android_app/stores.dart';
import 'package:android_app/grid_view.dart';
import 'package:get/get.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
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
        //scaffoldBackgroundColor: Colors.amber[50],
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),

      //home: const MainHomePage(),
      //home: const PopularServicesDetails(),
      home: const Stores(),
        //home: const StoresGridView(),
    );
  }
}
