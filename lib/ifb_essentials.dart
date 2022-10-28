import 'package:android_app/utils/dimensions.dart';
import 'package:android_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:android_app/utils/colors.dart';

class IfbEssentials extends StatefulWidget {
  const IfbEssentials({Key? key}) : super(key: key);

  @override
  State<IfbEssentials> createState() => _IfbEssentialsState();
}

class _IfbEssentialsState extends State<IfbEssentials> {
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
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Home', icon: Icons.home),
  Choice(title: 'Contact', icon: Icons.contacts),
  Choice(title: 'Map', icon: Icons.map),
  Choice(title: 'Phone', icon: Icons.phone),
  Choice(title: 'Camera', icon: Icons.camera_alt),
  Choice(title: 'Setting', icon: Icons.settings),
  Choice(title: 'Album', icon: Icons.photo_album),
  Choice(title: 'WiFi', icon: Icons.wifi),
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
      margin: const EdgeInsets.only(left: 10, right: 10),
      //shadowColor: AppColors.backgroundColor,
      //child: Container(
        height: Dimensions.screenWidth/3.0,
          width: Dimensions.screenWidth/3.0,
          //color: AppColors.backgroundColor,
          color: Colors.white,
          padding: const EdgeInsets.all(5.0),
         // margin: EdgeInsets.only(left: 15, right: 15),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //Expanded
                  const Card(
                    color: AppColors.backgroundColor,
                      margin: EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage("assets/icons/ac.png"),
                        height: 80,
                        width: 80,
                      ),
                      //Icon(choice.icon, size:80.0, )
              ),
                  SmallText(text: choice.title, ),
                ]
            ),
          )
      //),
    );

  }
}
