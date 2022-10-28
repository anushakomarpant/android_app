import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:android_app/utils/colors.dart';
import 'package:android_app/utils/dimensions.dart';
import 'package:android_app/widgets/big_text.dart';
import 'package:android_app/widgets/icon_and_text_widget.dart';
import 'package:android_app/widgets/small_text.dart';
import 'package:android_app/widgets/app_column.dart';
import 'package:android_app/widgets/expandable_text_widget.dart';


class StorePageBody extends StatefulWidget {
  const StorePageBody({Key? key}) : super(key: key);

  @override
  State<StorePageBody> createState() => _StorePageBodyState();
}

class _StorePageBodyState extends State<StorePageBody> {
  PageController pageController = PageController(viewportFraction: 1.0);
  var _currPageValue= 0.0;
  final double _scaleFactor= 0.6;//image size while scrolling horizontally
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
              top: Dimensions.height50,
              bottom: Dimensions.height15),
          padding: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Stores",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: AppColors.mainBlackColor,
                    fontSize: Dimensions.font26,
                    fontWeight: FontWeight.w400
                ),),
              Center(
                child: Container(
                  width: Dimensions.width45,
                  height: Dimensions.height45,

                  child: Icon(
                      Icons.search,
                      color:Colors.black,
                      size: Dimensions.iconSize32
                  ),),

              ),
            ],

          ),),


        //slider section
        SizedBox(
          //color: Colors.black,
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 2,
                itemBuilder: (context, position){
                  return _buildPageItem(position);
                })
        ),

        //Suggested Products
        SizedBox(height: Dimensions.height1),
        Container(
          margin:EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Suggested Products"),
              SizedBox(width: Dimensions.width10,),
            ],
          ),
        ),

        //list of images
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index){
              return Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.width5
                  ),
                  child: Row(
                    children:[
                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/newimages/b.jpg"),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          height: Dimensions.listViewTextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color:Colors.white,
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: Dimensions.width10,
                                  right: Dimensions.width10
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: "Senorita WX"),
                                  SizedBox(height: Dimensions.height10),
                                  SmallText(text: "₹ 32,000"),
                                  SizedBox(height: Dimensions.height20),
                                ],
                              )
                          ),
                        ),
                      ),
                    ],
                  )
              );
            }),

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
            padding: const EdgeInsets.only(bottom: 20.0),
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: Dimensions.pageViewContainer,
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