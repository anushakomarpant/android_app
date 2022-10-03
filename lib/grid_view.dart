import 'package:android_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:android_app/utils/colors.dart';

class StoresGridView extends StatefulWidget {
  const StoresGridView({Key? key}) : super(key: key);

  @override
  State<StoresGridView> createState() => _StoresGridViewState();
}

class _StoresGridViewState extends State<StoresGridView> {
  @override
  Widget build(BuildContext context) {
  return
    Column(
        children: [
          GridView.count(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List.generate(choices.length, (index) {
                return Center(
                  child: SelectCard(choice: choices[index]),
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
    return Container(
        color: AppColors.backgroundColor,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Icon(choice.icon, size:60.0, )),
              SmallText(text: choice.title, ),
            ]
        ),
        )
    );

  }
  }
