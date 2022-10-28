import 'package:android_app/utils/dimensions.dart';
import 'package:android_app/widgets/big_text.dart';
import 'package:android_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:android_app/utils/colors.dart';

class HList extends StatefulWidget {
  const HList({Key? key}) : super(key: key);

  @override
  State<HList> createState() => _HListState();
}

class _HListState extends State<HList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            //height: 150,
            height: Dimensions.screenWidth/4,

            child: ListView(
                padding: EdgeInsets.only(
                  left:Dimensions.width20,
                  right: Dimensions.width20,
                  top: 0,
                  bottom: 0,
                ),
                scrollDirection: Axis.horizontal,
                //physics: const NeverScrollableScrollPhysics(),
                //shrinkWrap: true,
                children:
                List.generate(choices.length, (index) {
                  return Center(
                    child: SelectCard(choice: choices[index]),
                  );
                }
                ),


                    /*
                [
                  Container(
                    width: 200,
                    color: Colors.purple[600],
                    child: const Center(child: Text('item1',
                      style: TextStyle(fontSize: 18,color: Colors.white),),),
                  ),
                  Container(
                    width: 200,
                    color: Colors.purple[500],
                    child: const Center(child: Text('item1',
                      style: TextStyle(fontSize: 18,color: Colors.white),),),
                  ),
                  Container(
                    width: 200,
                    color: Colors.purple[400],
                    child: const Center(child: Text('item1',
                      style: TextStyle(fontSize: 18,color: Colors.white),),),
                  ),
                ]

                     */
            ),
          ),

          Container(
            //height: 150,
            height: Dimensions.screenWidth/4,

            child: ListView(
              padding: EdgeInsets.only(
                left:Dimensions.width20,
                right: Dimensions.width20,
                top: 0,
                bottom: 0,
              ),
              scrollDirection: Axis.horizontal,
              //physics: const NeverScrollableScrollPhysics(),
              //shrinkWrap: true,
              children:
              List.generate(choices.length, (index) {
                return Center(
                  child: SelectText(choice: choices[index]),
                );
              }
              ),
            ),
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
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Senorita TL', icon: Icons.map),
  Choice(title: 'Senorita TL1', icon: Icons.map),
  Choice(title: 'Senorita TL2', icon: Icons.map),
  Choice(title: 'Senorita TL3', icon: Icons.map),
  Choice(title: 'Senorita TL4', icon: Icons.map),
  Choice(title: 'Senorita TL5', icon: Icons.map),
  Choice(title: 'Senorita TL6', icon: Icons.map),
  Choice(title: 'Senorita TL7', icon: Icons.map),

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
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Expanded
                  Container(
                  //width:150,
                    width: Dimensions.screenWidth/4,
                    height: Dimensions.screenWidth/4,
                    child: Icon(choice.icon, size:60.0, ),
                ),
                //SizedBox(width:Dimensions.width20)
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
      width: Dimensions.screenWidth/4,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: Dimensions.height15,),

            SmallText(text: choice.title, ),

            //Text(choice.title, ),
          ]
      ),
    );

  }
}

