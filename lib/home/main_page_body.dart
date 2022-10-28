import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:android_app/utils/colors.dart';
import 'package:android_app/utils/dimensions.dart';
import 'package:android_app/widgets/big_text.dart';
import 'package:android_app/widgets/icon_and_text_widget.dart';
import 'package:android_app/widgets/small_text.dart';
import 'package:android_app/widgets/app_column.dart';

class MainPageBody extends StatefulWidget {
  const MainPageBody({Key? key}) : super(key: key);

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currPageValue= 0.0;
  double _scaleFactor= 0.8;
  double _height= Dimensions.pageViewContainer;//same as size of image

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;
        print("Current value is "+_currPageValue.toString());
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          //color: Colors.black,
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position){
                  return _buildPageItem(position);
                })
        ),
        //dots
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainBlackColor,
            size: const Size.square(7.0),
            activeSize: const Size(14.0, 7.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          ),
        ),

        //popular text
        SizedBox(height: Dimensions.height30),
        Container(
          margin:EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                child: SmallText(text: "services"),
              ),
            ],
          ),
        ),
        //list of images
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index){
              return Container(
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.width5),
                  child: Row(
                    children:[

                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/b.jpg"),
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
                              padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: "Event Management Services"),
                                  SizedBox(height: Dimensions.height10),
                                  SmallText(text: "We provide different event management services in Goa"),
                                  SizedBox(height: Dimensions.height20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndText(icon: Icons.circle_sharp,
                                          text: "Normal",
                                          iconColor: AppColors.iconColor1),
                                      //SizedBox(width: 20),

                                      IconAndText(icon: Icons.location_on,
                                          text: "1.7km",
                                          iconColor: AppColors.mainColor),
                                      //SizedBox(width: 20),

                                      IconAndText(icon: Icons.access_time_rounded,
                                          text: "32min",
                                          iconColor: AppColors.iconColor2),

                                    ],
                                  )

                                ],
                              )
                          ),
                        ),
                      )
                    ],
                  )

              );
            })

      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index ==_currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index ==_currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
    }

    return Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: Dimensions.pageViewContainer,//image height
              margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, top: Dimensions.height5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius10),
                color: index.isEven?Color(0xFF89dad0):Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: index.isEven?AssetImage("assets/images/b.jpg"):AssetImage("assets/images/a.jpg")
                  /*
                if(index==0)
                  {
                  image: AssetImage("assets/images/b.jpg"),
                  }
                else if(index==1)
                {
                  image: AssetImage("assets/images/a.jpg")
                }
          else if(index==2)
          {
            image: AssetImage("assets/images/c2.jpg")
          }
          else if(index==3)
          {
            image: AssetImage("assets/images/e.jpg")
          }
          else()
    {
    image: AssetImage("assets/images/f.jpg")
    }
*/
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(5, 5)
                      ),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5,0)
                      ),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(5,0)
                      ),
                    ]
                ),

                //the first box above dots indicator
                child: Container(
                    //padding: EdgeInsets.only(top:Dimensions.height5,left:Dimensions.height25 ,right:Dimensions.height15),
                    padding: EdgeInsets.only(left:Dimensions.height25 ,right:Dimensions.height15),
                    child: AppColumn(text: "Event Managemnet Services")
                ),

              ),
            ),
          ],
        )
    );

  }
}
