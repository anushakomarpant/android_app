import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:android_app/utils/colors.dart';
import 'package:android_app/utils/dimensions.dart';
import 'package:android_app/widgets/big_text.dart';
import 'package:android_app/widgets/small_text.dart';
import 'package:android_app/home/main_page_body.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}


class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          //showing the header
          Container(

            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text:"ProServices"),
                      Row(
                          children: [
                            SmallText(text:"City", color: AppColors.mainColor),
                            Icon(Icons.arrow_drop_down_rounded)
                          ]
                      )
                    ],
                  ), //Column
                  Center(
                    child: Container(
                      width: Dimensions.width45,
                      height: Dimensions.height45,

                      child: Icon(Icons.account_circle_rounded, color:Colors.black, size: Dimensions.iconSize28),

                      //LogInPage(),
                    ),
                    //home: LogInPage(),
                  ),
                ],
              ), //Row
            ), //Container
          ),
          //showing the homePageBody
          Expanded(child: SingleChildScrollView(
            child: MainPageBody(),
          ))

        ],
      ),
    );
  }
}
