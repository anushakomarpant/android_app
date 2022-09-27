import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:android_app/utils/colors.dart';
import 'package:android_app/utils/dimensions.dart';
import 'package:android_app/popular_services_details.dart';
import 'package:android_app/utils/colors.dart';
import 'package:android_app/widgets/big_text.dart';
import 'package:android_app/widgets/small_text.dart';
import 'package:android_app/store_page_body.dart';
import 'package:android_app/home/main_page_body.dart';
class Stores extends StatefulWidget {
  const Stores({Key? key}) : super(key: key);

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          //showing the header
          Container(

            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height50,
                  bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Stores",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: AppColors.mainBlackColor,
                              fontSize: Dimensions.font26,
                              fontWeight: FontWeight.w400
                          )
                      ),
                    ],
                  ), //Column
                  Center(
                    child: Container(
                      width: Dimensions.width45,
                      height: Dimensions.height45,

                      child: Icon(
                          Icons.search,
                          color:Colors.black,
                          size: Dimensions.iconSize32),

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
            //child:PopularServicesDetails(),
            child: StorePageBody(),


          ))


        ],
      ),
    );
  }
}
