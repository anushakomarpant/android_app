import 'package:android_app/password_login/home_screen.dart';
import 'package:android_app/password_login/login_password.dart';
import 'package:android_app/password_login/register_password.dart';
import 'package:android_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
          decoration:const BoxDecoration(

            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/newimages/f.jpg")
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: Dimensions.height50*5.5,),

              Container(
                width: double.infinity,
                //height: Dimensions.height30,
                padding: EdgeInsets.all(16),
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey[400]!),
                    ),
                    //style: TextButton.styleFrom(primary: Colors.grey),
                    child: Text("REGISTER",
                      style: TextStyle(
                        color: Colors.white,
                        //height: Dimensions.height5,
                        //backgroundColor:  Colors.grey[200],
                      ),),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreenWithPassword()));
                    }
                  //color: Colors.blue,
                ),
              ),

              SizedBox(height: 16,),

              SizedBox(
                width: Dimensions.screenWidth,
                child: Center(
                  child: Text("Already a user??"),
                ),
              ),
              //SizedBox(height: 10,),

              Container(
                width: double.infinity,
                //height: Dimensions.height30,
                padding: EdgeInsets.all(16),
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey[300]!),
                    ),
                    //style: TextButton.styleFrom(primary: Colors.grey),
                    child: Text("LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        //height: Dimensions.height5,
                        //backgroundColor:  Colors.grey[200],
                      ),),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenWithPassword()));
                    }
                  //color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      );
  }
}
