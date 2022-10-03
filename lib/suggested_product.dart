import 'package:android_app/utils/dimensions.dart';
import 'package:android_app/widgets/big_text.dart';
import 'package:android_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:android_app/utils/colors.dart';

class SuggestedProduct extends StatefulWidget {
  const SuggestedProduct({Key? key}) : super(key: key);

  @override
  State<SuggestedProduct> createState() => _SuggestedProductState();
}

class _SuggestedProductState extends State<SuggestedProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
       // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.count(
              padding: EdgeInsets.only(
                  left:Dimensions.width20,
                  right: Dimensions.width20,
              ),
              //scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List.generate(choices.length, (index) {
                return Center(
                  child: SelectCard(choice: choices[index]),
                );
              }
              )
          ),

          GridView.count(
              padding: EdgeInsets.only(
                  left:Dimensions.width20,
                  right: Dimensions.width20,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,

              //To reduce height of grid containing text
              childAspectRatio: Dimensions.screenWidth/(Dimensions.screenHeight/4),
              children: List.generate(choices.length, (index) {
                return SizedBox(
                  child: SelectText(choice: choices[index]),
                );
              }
              )
          ),

        ]
    );
  }
}

class Choice {
  const Choice({required this.title, required this.price, required this.icon});
  final String title;
  final String price;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Senorita WX', price: '₹ 32,000', icon: Icons.home),
  Choice(title: 'Senorita ZXS', price: '₹ 36,550', icon: Icons.contacts),
  Choice(title: 'Senorita TL-SSDB 7.5Kg', price: '₹ 22,990', icon: Icons.map),

];

class SelectCard extends StatelessWidget {
  const SelectCard({ Key ? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    //return Card
    return Card(
        //color: Colors.orange[50],
        color: AppColors.backgroundColor2, //orange.shade50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(20.0),
          ),),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Icon(choice.icon, size:60.0, ),
                    ),
                //Text(choice.title, ),

                //Text(choice.title, ),
              ]
          ),
        )
    );

  }
}

class SelectText extends StatelessWidget {
  const SelectText({ Key ? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    //return Card
    return SizedBox(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: Dimensions.height15,),

                SmallText(text: choice.title, ),

                SizedBox(height: Dimensions.height5,),

                SmallText(text: choice.price, color: Colors.grey.shade600, ),

                //Text(choice.title, ),
              ]
          ),
    );

  }
}
