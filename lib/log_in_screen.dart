import 'package:android_app/utils/dimensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:android_app/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future registerUser(String phone, BuildContext context) async{
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          Navigator.of(context).pop();

          UserCredential result = await _auth.signInWithCredential(credential);

          User? user = result.user;

          if(user != null){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => HomeScreen(user: user,)
            ));
          }else{
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (FirebaseAuthException exception){
          print(exception);
        },
        codeSent: (String verificationId, forceResendingToken){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Give the code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text("Confirm",style: TextStyle(color: Colors.white,backgroundColor: Colors.blue,),),
                      //style: ButtonStyle(backgroundColor: Colors.blue,),
                      //color: Colors.blue,
                      onPressed: () async{
                        final code = _codeController.text.trim();
                        AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);

                        UserCredential result = await _auth.signInWithCredential(credential);

                        User? user = result.user;

                        if(user != null){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => HomeScreen(user: user,)
                          ));
                        }else{
                          print("Error");
                        }
                      },
                    ),
                  ],
                );
              }
          );
        },
        codeAutoRetrievalTimeout: (String verificationId){
          verificationId = verificationId;
          print(verificationId);
          print("Timeout");
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20,),

                  Text("Login", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),

                  SizedBox(height: 16,),

                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      /*
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey)//[200]
                        ),
                       */
                      /*
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey)//[300]
                        ),
                       */
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Mobile Number"

                    ),
                    controller: _phoneController,
                  ),

                  SizedBox(height: 16,),


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
                     // textColor: Colors.white,
                      //padding: EdgeInsets.all(16),
                      onPressed: () {
                        final phone = _phoneController.text.trim();

                        registerUser(phone, context);

                      },
                      //color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}



/*
class LoginScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  //Place A
  Future registerUser(String mobile, BuildContext context) async{
    FirebaseAuth _auth =FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: mobile,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential authCresential){
          _auth.signInWithCredential(_credential).then((AuthResult result) {
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context)=>HomeScreen(result.user)
            ));
          }).catchError((e){
            print(e);
          });
          /*
          //code for signing in
}).catchError((e){
  print(e);
});
           */
        },
        verificationFailed: (FirebaseAuthException authException){
          print(authException.message);
        },
        codeSent: (String verificationId, [int forceResendingToken]){
          //show dialog to take input from the user
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                title: Text("Enter SMS Code"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _codeController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Done"),
                    textColor: Colors.white,
                    color: Colors.redAccent,
                    onPressed:(){
                      FirebaseAuth auth = FirebaseAuth.instance;
                      smsCode = _codeController.text.trim();
                      _credential= PhoneAuthProvider.getCredential(
                        verificationId: verificationId,
                        smsCode: smsCode);
                      auth.signInWithCredential(_credential).then((AuthResult result) {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => HomeScreen(result.user)
                        ));
                      }).catchError((e){
                        print(e);
                      });
                    },
                  )
                ],
              ));
        },
        codeAutoRetrievalTimeout: (String verificationId){
          verificationId = verificationId;
          print(verificationId);
          print("Timeout");
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Login", style: TextStyle(color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),),

                SizedBox(height: 16,),

                TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: "Phone Number"

                  ),
                  controller: _phoneController,
                ),

                SizedBox(height: 16,),

                TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: "Password"

                  ),

                  controller: _passController,
                ),

                SizedBox(height: 16,),

                Container(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text("Login"),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(16),
                    onPressed: (){
                      //code for sign in
                      //Place B
                        final mobile = _phoneController.text.trim();
                        registerUser(mobile, context);

                    },
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}

 */