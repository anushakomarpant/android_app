
import 'package:android_app/widgets/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:android_app/utils/colors.dart';
import 'package:android_app/utils/dimensions.dart';
import 'package:android_app/widgets/app_column.dart';
import 'package:android_app/widgets/big_text.dart';
import 'package:android_app/widgets/expandable_text_widget.dart';
import 'package:android_app/widgets/icon_and_text_widget.dart';
import 'package:android_app/widgets/small_text.dart';

class PopularServicesDetails extends StatelessWidget {
  const PopularServicesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularServicesImgSize,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/h2.jpg")
                    )
                ),
              )),
          //icon widget
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),
          //about service
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularServicesImgSize-20,

              child:Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),

                    ),
                    color: Colors.white,
                  ),


                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppColumn(text: "Event Management Services"),
                      SizedBox(height: Dimensions.height20,),
                      BigText(text: "About Us"),
                      const Expanded(child:
                      SingleChildScrollView(child:
                      ExpandableTextWidget(text:
                      "Event management involves overseeing all logistics leading up "
                          "to and during an event, whether a conference, wedding, or any "
                          "organized gathering. Event managers execute the event plans by "
                          "managing staff, finances, vendor relationships, and more."
                      ),
                      ),
                      ),
                    ],
                  )
              )
          ),


        ],
      ),
      bottomNavigationBar:
      Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20
        ),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(

              topLeft: Radius.circular(Dimensions.radius20*2),
              topRight: Radius.circular(Dimensions.radius20*2),

            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20,),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width5,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width5,),
                  const Icon(Icons.add, color: AppColors.signColor,),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20
              ),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20,),
                color: AppColors.mainColor,
              ),
              child: BigText(text:"\$10 | add to cart", color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
