import 'package:android_app/dashboard/ifb.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreenPassword extends StatelessWidget {

  final User user;

  HomeScreenPassword({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("You are Logged in succesfully", style: TextStyle(color: Colors.lightBlue, fontSize: 32),),
            SizedBox(height: 16,),
            Text("${user.email}", style: TextStyle(color: Colors.grey, ),),
            Container(
              width: double.infinity,
              //height: Dimensions.height30,
              padding: EdgeInsets.all(16),
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey[400]!),
                  ),
                  //style: TextButton.styleFrom(primary: Colors.grey),
                  child: Text("HOME",
                    style: TextStyle(
                      color: Colors.white,
                      //height: Dimensions.height5,
                      //backgroundColor:  Colors.grey[200],
                    ),),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => IFBMyApi()));
                  }
                //color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class HomeScreen extends StatelessWidget {

  final FirebaseUser user;

  HomeScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("You are Logged in succesfully", style: TextStyle(color: Colors.lightBlue, fontSize: 32),),
            SizedBox(height: 16,),
            Text("${user.phoneNumber}", style: TextStyle(color: Colors.grey, ),),
          ],
        ),
      ),
    );
  }
}

 */