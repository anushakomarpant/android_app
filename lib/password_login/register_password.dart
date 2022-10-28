import 'package:android_app/password_login/home_screen.dart';
import 'package:android_app/utils/dimensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:android_app/home_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreenWithPassword extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  //var authHandler = LoginScreenWithPassword();
  var authHandler = new Auth();
/*
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
   // _auth.signInWithEmailAndPassword(email: email, password: password)
   //_auth.createUserWithEmailAndPassword(email: email, password: password);
  }

 */
  /*
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress,
    password: password,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
   */
/*
  Future loginWithEmail(String email,String password) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;
    return user;
  }

  Future registerWithEmail(String name, String email, String password) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;
    return user;
  }
*/
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
                  SizedBox(height: 21,),

                  Text("Create Account", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),

                  const SizedBox(height: 16),

                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "First Name"
                    ),
                    //controller: _phoneController,
                    controller: _firstnameController,
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Last Name"
                    ),
                    //controller: _phoneController,
                    controller: _lastnameController,
                  ),



                  const SizedBox(height: 16),

                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Email"
                    ),
                    //controller: _phoneController,
                    controller: _emailController,
                  ),

                  SizedBox(height: 16),

                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Set Password"
                    ),
                    controller: _passwordController,
                  ),


                  const SizedBox(height: 16),

                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Mobile Number"
                    ),
                    //controller: _phoneController,
                    controller: _phoneController,
                  ),


                  SizedBox(height: 50,),


                  Container(
                    width: double.infinity,
                    //height: Dimensions.height30,
                    padding: EdgeInsets.all(16),
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey[300]!),
                        ),
                        //style: TextButton.styleFrom(primary: Colors.grey),
                        child: Text("Verify & Register",
                          style: TextStyle(
                            color: Colors.white,
                            //height: Dimensions.height5,
                            //backgroundColor:  Colors.grey[200],
                          ),),
                        // textColor: Colors.white,
                        //padding: EdgeInsets.all(16),
                        /*
                      onPressed: () {
                        final phone = _phoneController.text.trim();
                        //final password = _passwordController;
                        //final password = _passwordController;
                        registerUser(phone, context);
                      },
                       */
/*
                        onPressed: () {
                          authHandler.loginWithEmail(_emailController.text, _passwordController.text)
                              .then((user) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(user: user,)));
                          }).catchError((e) => print(e));
                        }
 */

                        onPressed: () {
                          authHandler.handleSignUp(_emailController.text, _passwordController.text)
                              .then((User user) {
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomeScreenPassword(user: user)));
                          }).catchError((e) => print(e));
                        }
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

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<User> handleSignInEmail(String email, String password) async {
    UserCredential result =
    await auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;
    return user;
  }

  Future<User> handleSignUp(email, password) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final User user = result.user!;
    return user;
  }
/*
  Future<User> handleSignInEmail(String email, String password) async {
    try{
      UserCredential result =
      await auth.signInWithEmailAndPassword(email: email, password: password);
      final User user = result.user!;
      return user;
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    UserCredential result =
    await auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;
    return user;
  }

     */
/*
  Future<User> handleSignUp(email, password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //final User user = result.user!;
      //return user;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;
    return user;
  }

 */


}
