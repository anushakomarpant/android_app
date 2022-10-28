import 'package:android_app/utils/dimensions.dart';
import 'package:android_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:android_app/utils/colors.dart';


class Essentials extends StatefulWidget {
  const Essentials({Key? key}) : super(key: key);

  @override
  State<Essentials> createState() => _EssentialsState();
}

class _EssentialsState extends State<Essentials> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.screenWidth/2.5,

          child:
          ListView(
              padding: EdgeInsets.zero,
              //physics: const NeverScrollableScrollPhysics(),
              //shrinkWrap: true,
              //crossAxisCount: 4,
              //crossAxisSpacing: 4.0,
              //mainAxisSpacing: 8.0,
              scrollDirection: Axis.horizontal,
              children: List.generate(choices.length, (index) {
                return Center(
                  child: SelectCard(choice: choices[index]),
                );
              }
              )
          ),
        ),
      ],
    );
  }
}

class Choice {
  const Choice({required this.title, required this.icon, required this.img});
  final String title;
  final IconData icon;
  //final Image img;
  final String img;
}
 List<Choice> choices = <Choice>[
  const Choice(title: 'Fabric Care', icon: Icons.home, img: "assets/newimages/fabric_care.jpg"),
  const Choice(title: 'Machine Care', icon: Icons.contacts, img: "assets/newimages/dishwasher.jpg"),
  const Choice(title: 'Dish Care', icon: Icons.map, img: "assets/newimages/fabric_care1.jpg"),
  const Choice(title: 'Kitchen Care', icon: Icons.phone, img: "assets/newimages/kitchen1.jpg"),
  const Choice(title: 'Camera', icon: Icons.camera_alt, img: "assets/newimages/kitchen2.jpg"),
  const Choice(title: 'Setting', icon: Icons.settings, img: "assets/newimages/kitchen3.jpg"),
];

class SelectCard extends StatelessWidget {
  const SelectCard({ Key ? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    //return Card
    return
      //Card
      Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          //shadowColor: AppColors.backgroundColor,
          //child: Container(
          height: Dimensions.screenWidth/2.6,
          width: Dimensions.screenWidth/3.1,
          color: AppColors.backgroundColor,
          //color: Colors.white,
          //padding: const EdgeInsets.all(5.0),
          // margin: EdgeInsets.only(left: 15, right: 15),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //Expanded
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(top: 10,bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(choice.img)
                        //image: AssetImage("assets/newimages/fabric_care.jpg"),
                        ),
                    ),
                  ),
            /*Card(
                    color: AppColors.mainBlackColor,
                    margin: const EdgeInsets.all(10),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0),),),
                    child: Image(
                      image: AssetImage("assets/newimages/fabric_care.jpg"),
                      fit: BoxFit.cover,//fill,
                      height: 100,
                      width: 100,
                    ),
                    //Icon(choice.icon, size:80.0, )
                  ),
             */
                  SmallText(text: choice.title, ),
                ]
            ),
          )
        //),
      );

  }
}
