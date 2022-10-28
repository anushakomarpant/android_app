import 'package:android_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final String email;
  late final String mobile_no;
  late final String password;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: 
      Stack(
        children: [
          Container(


            decoration:const BoxDecoration(

              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/newimages/f.jpg")
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height50,
                ),
                Center(
                  child: Expanded(
                    child: Card(
                      margin: EdgeInsets.all(Dimensions.width35),
                      //color: Colors.black,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.2),
                              //Colors.grey.withOpacity(0.0),
                              //Colors.black
                            ],
                            //stops: [0.0, 1.1]
                          ),
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            SizedBox(
                              height: Dimensions.height50,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                left:Dimensions.width30,
                                top: 10,
                                //bottom: 5
                              ),
                              child: Text("First name",style: TextStyle(color: Colors.white, fontSize: 16),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:Dimensions.width30,right: Dimensions.width35),
                              child: TextField(
                                //keyboardType: TextInputType.number,
                                //inputFormatters: [LengthLimitingTextInputFormatter(6)],
                                showCursor: true,
                                cursorHeight: Dimensions.height30,
                                cursorColor: Colors.grey,
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  //border: InputBorder.none,
                                  labelText: 'Enter First name',
                                  labelStyle: TextStyle(color: Colors.white),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.only(
                                    // left: 15,
                                    //top: 10,
                                      bottom: 10
                                  ),
                                  //hintText: 'Enter Pincode',
                                  counterText: '',
                                ),
                                onChanged: (value) => email =value,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                left:Dimensions.width30,
                                top: 10,
                                //bottom: 5
                              ),
                              child: Text("Last Name",style: TextStyle(color: Colors.white, fontSize: 16),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:Dimensions.width30,right: Dimensions.width35),
                              child: TextField(
                                //keyboardType: TextInputType.number,
                                //inputFormatters: [LengthLimitingTextInputFormatter(6)],
                                showCursor: true,
                                cursorHeight: Dimensions.height30,
                                cursorColor: Colors.grey,
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  //border: InputBorder.none,
                                  labelText: 'Enter Last Name',
                                  labelStyle: TextStyle(color: Colors.white),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.only(
                                    // left: 15,
                                    //top: 10,
                                      bottom: 10
                                  ),
                                  //hintText: 'Enter Pincode',
                                  counterText: '',
                                ),
                                onChanged: (value) => email =value,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),


                            Padding(
                              padding: EdgeInsets.only(
                                left:Dimensions.width30,
                                top: 10,
                                //bottom: 5
                              ),
                              child: Text("Email Address",style: TextStyle(color: Colors.white, fontSize: 16),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:Dimensions.width30,right: Dimensions.width35),
                              child: TextField(
                                //keyboardType: TextInputType.number,
                                //inputFormatters: [LengthLimitingTextInputFormatter(6)],
                                showCursor: true,
                                cursorHeight: Dimensions.height30,
                                cursorColor: Colors.grey,
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  //border: InputBorder.none,
                                  labelText: 'Enter Email address',
                                  labelStyle: TextStyle(color: Colors.white),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.only(
                                    // left: 15,
                                    //top: 10,
                                      bottom: 10
                                  ),
                                  //hintText: 'Enter Pincode',
                                  counterText: '',
                                ),
                                onChanged: (value) => email =value,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                left:Dimensions.width30,
                                top: 10,),
                              child: const Text("Mobile No.", style: TextStyle(color: Colors.white, fontSize: 16),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:Dimensions.width30,right: Dimensions.width35),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                                showCursor: true,
                                cursorHeight: Dimensions.height30,
                                cursorColor: Colors.grey,
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  //border: InputBorder.none,
                                  labelText: 'Enter phone Number',
                                  labelStyle: TextStyle(color: Colors.white),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.only(
                                    // left: 15,
                                    //top: 10,
                                      bottom: 10
                                  ),
                                  //hintText: 'Enter Pincode',
                                  counterText: '',
                                ),
                                onChanged: (value) => mobile_no =value,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                left:Dimensions.width30,
                                top: 10,
                                //bottom: 5
                              ),
                              child: Text("DOB",style: TextStyle(color: Colors.white, fontSize: 16),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:Dimensions.width30,right: Dimensions.width35),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [LengthLimitingTextInputFormatter(8)],
                                showCursor: true,
                                cursorHeight: Dimensions.height30,
                                cursorColor: Colors.grey,
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  //border: InputBorder.none,
                                  labelText: 'Enter Date of Birth',
                                  labelStyle: TextStyle(color: Colors.white),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.only(
                                    // left: 15,
                                    //top: 10,
                                      bottom: 10
                                  ),
                                  //hintText: 'Enter Pincode',
                                  counterText: '',
                                ),
                                onChanged: (value) => email =value,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),


                            Padding(
                              padding: EdgeInsets.only(
                                left:Dimensions.width30,
                                top: 10,
                                //bottom: 5
                              ),
                              child: Text("Password",style: TextStyle(color: Colors.white, fontSize: 16),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:Dimensions.width30,right: Dimensions.width35),
                              child: TextField(
                                //keyboardType: TextInputType.number,
                                //inputFormatters: [LengthLimitingTextInputFormatter(6)],
                                showCursor: true,
                                cursorHeight: Dimensions.height30,
                                cursorColor: Colors.grey,
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  //border: InputBorder.none,
                                  labelText: 'Enter password',
                                  labelStyle: TextStyle(color: Colors.white),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.only(
                                    // left: 15,
                                    //top: 10,
                                      bottom: 10
                                  ),
                                  //hintText: 'Enter Pincode',
                                  counterText: '',
                                ),
                                onChanged: (value) => password =value,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                left:Dimensions.width30,
                                top: 10,
                                //bottom: 5
                              ),
                              child: Text("Re-enter Password",style: TextStyle(color: Colors.white, fontSize: 16),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:Dimensions.width30,right: Dimensions.width35),
                              child: TextField(
                                //keyboardType: TextInputType.number,
                                //inputFormatters: [LengthLimitingTextInputFormatter(6)],
                                showCursor: true,
                                cursorHeight: Dimensions.height30,
                                cursorColor: Colors.grey,
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  //border: InputBorder.none,
                                  labelText: 'Enter password again',
                                  labelStyle: TextStyle(color: Colors.white),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.only(
                                    // left: 15,
                                    //top: 10,
                                      bottom: 10
                                  ),
                                  //hintText: 'Enter Pincode',
                                  counterText: '',
                                ),
                                onChanged: (value) => password =value,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),


                            SizedBox(
                              height: Dimensions.height50*2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
