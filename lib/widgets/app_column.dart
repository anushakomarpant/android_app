import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:android_app/utils/colors.dart';
import 'package:android_app/utils/dimensions.dart';
import 'package:android_app/widgets/small_text.dart';

import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:Dimensions.height15,left:Dimensions.height25 ,right:Dimensions.height15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: text, size: Dimensions.font26,),
          SizedBox(height: Dimensions.height1),

          Row(
            children: [
              Wrap(
                children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size:15)),
              ),
              SizedBox(width: Dimensions.height10),
              SmallText(text: "4.5",color: Colors.grey),
              SizedBox(width: Dimensions.height10),
              SmallText(text: "1.2K",color: Colors.grey),
              SizedBox(width: Dimensions.height10),
              SmallText(text: "comments",color: Colors.grey),
            ],
          ),
          SizedBox(height: Dimensions.height20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndText(icon: Icons.circle_sharp,
                  text: "Normal",
                  iconColor: AppColors.iconColor1),
              //SizedBox(width: 20),

              IconAndText(icon: Icons.location_on,
                  text: "1.7km",
                  iconColor: AppColors.mainColor),
              //SizedBox(width: 20),

              IconAndText(icon: Icons.access_time_rounded,
                  text: "32min",
                  iconColor: AppColors.iconColor2),

            ],
          )
        ],
      ),

    );
  }
}
