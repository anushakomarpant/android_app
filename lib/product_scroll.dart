import 'package:android_app/essentials.dart';
import 'package:android_app/horizontal_list.dart';
import 'package:android_app/ifb_essentials.dart';
import 'package:android_app/orders.dart';
import 'package:android_app/suggested_product.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:android_app/utils/colors.dart';
import 'package:android_app/utils/dimensions.dart';
import 'package:android_app/widgets/big_text.dart';
import 'package:android_app/widgets/icon_and_text_widget.dart';
import 'package:android_app/widgets/small_text.dart';
import 'package:android_app/widgets/app_column.dart';
import 'package:android_app/widgets/expandable_text_widget.dart';
import 'package:android_app/grid_view.dart';

class ProductScroll extends StatefulWidget {
  const ProductScroll({Key? key}) : super(key: key);

  @override
  State<ProductScroll> createState() => _ProductScrollState();
}

class _ProductScrollState extends State<ProductScroll> {
  PageController pageController = PageController(viewportFraction: 1.0);
  var _currPageValue= 0.0;
  final double _scaleFactor= 1.0;//image size while scrolling horizontally
  final double _height= Dimensions.pageViewContainer;//same as size of image

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;
        //print("Current value is "+_currPageValue.toString());
      });
    });
  }
  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: Dimensions.height45,
              bottom: Dimensions.height15),
          padding: EdgeInsets.only(
              top: Dimensions.height10,
              left: Dimensions.width20,
              right: Dimensions.width20),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(text: "Stores"),
              Center(
                child:
                  Icon(
                      Icons.search_sharp,
                      color:Colors.black,
                      size: Dimensions.iconSize30,
                  ),

              ),
            ],

          ),),
        Stack(
          children: [
            SizedBox(
              /*
              Changes made here affects the position of dots indicator too
            hence its necessary to change 'container padding top' in which dots indicator are placed
                */

              //height: Dimensions.pageView2,
              //height: 2000,
              height: Dimensions.pageView4,
                child:
                PageView.builder(
                    controller: pageController,
                    itemCount: 2,
                    itemBuilder: (context, position){
                      return _buildPageItem(position);
                    })
            ),

            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.height40*5,
                //top: 190,

                child:Container(
                  //height: double.maxFinite,
                  padding: EdgeInsets.only(
                      top: Dimensions.height10,
                      //bottom: Dimensions.height30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius30),
                      topLeft: Radius.circular(Dimensions.radius30),

                    ),
                    color: AppColors.backgroundColor,
                    //color: AppColors.mainBlackColor,
                    //color: Colors.white,

                  ),
                )
            ),

          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: Dimensions.width20,
            //top: Dimensions.height20,
            //bottom: Dimensions.height30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "Suggested Products"),
              SizedBox(height: Dimensions.height25),
            ],
          ),
        ),

        const SuggestedProduct(),
        SizedBox(height: Dimensions.height25),

        Container(
          padding: EdgeInsets.only(
              top: Dimensions.height10,
              left: Dimensions.width20,
              right: Dimensions.width20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    left: Dimensions.width15,
                    right: Dimensions.width15,
                    bottom: Dimensions.height10),
                height: Dimensions.height40*2,
                width: Dimensions.screenWidth/2.3,

                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0),),
                  color: AppColors.iconColor,
                ),

                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.location_on_outlined,
                      size: 55,
                      color: Colors.white,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallText(text: "Locate your", color: Colors.white,),
                        SmallText(text: "nearest Store", color: Colors.white,),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    left: Dimensions.width15,
                    right: Dimensions.width15,
                    bottom: Dimensions.height10),
                height: Dimensions.height40*2,
                width: Dimensions.screenWidth/2.3,

                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0),),
                  color: AppColors.backgroundColor2,
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     BigText(text: "FASTCOOL",
                      //size: 15,
                    ),
                    SmallText(text: "AC Calculator", ),

                  ],
                ),
              ),

            ],
          ),
        ),

        SizedBox(height: Dimensions.height35),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: Dimensions.width20,
            //top: Dimensions.height20,
            //bottom: Dimensions.height30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "All Products"),
              SizedBox(height: Dimensions.height25),

            ],
          ),
        ),

        const StoresGridView(),

        SizedBox(height: Dimensions.height25),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: Dimensions.width20,
            //top: Dimensions.height20,
            //bottom: Dimensions.height30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "IFB Essentials"),
              SizedBox(height: Dimensions.height25),

            ],
          ),
        ),

        const Essentials(),

        SizedBox(height: Dimensions.height25),

        const IfbEssentials(),

        SizedBox(height: Dimensions.height25),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            //top: Dimensions.height20,
            //bottom: Dimensions.height30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "My Orders - Latest"),
                  SmallText(text: "Show All"),
                ],
              ),
              SizedBox(height: Dimensions.height25),
            ],
          ),
        ),

        const MyOrders(),
        SizedBox(height: Dimensions.height25),


      ],
    );
  }

  Widget _buildPageItem(int index){
    Matrix4 matrix = Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index ==_currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index ==_currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,//image height
            margin: EdgeInsets.only(
              top: Dimensions.height1,
            ),
            decoration: BoxDecoration(
              color: index.isEven?const Color(0xFF89dad0):const Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                  index.isEven?
                  const AssetImage("assets/newimages/e.jpg")
                      :const AssetImage("assets/newimages/i.jpg")
              ),
            ),
          ),
          Container(
            //padding: const EdgeInsets.only(top: 150),
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(
                top: Dimensions.height45*3.5,
            ),
            child: SizedBox(
              //height: Dimensions.pageViewContainer,
              //height: Dimensions.pageView,
              //height: Dimensions.scrollPageView1,
              child:
              DotsIndicator(
                dotsCount: 2,
                position: _currPageValue,
                decorator: DotsDecorator(
                  activeColor: AppColors.mainBlackColor,
                  size: const Size.square(7.0),
                  activeSize: const Size(7.0, 7.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                ),),

            ),
          ),



        ],
      ),
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
    return Card(
        color: Colors.orange[100],
        child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Icon(choice.icon, size:60.0, )),
              Text(choice.title, ),
            ]
        ),
        )
    );
  }
}

