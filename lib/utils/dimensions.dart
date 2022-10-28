import 'package:get/get.dart';
class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double scrollPageView1 = screenHeight/1.5;
  static double scrollPageView = screenHeight/2;

  static double pageView = screenHeight/2.64;
  static double pageView1 = screenHeight/2.75;
  static double pageView2 = screenHeight/3;
  static double pageView3 = screenHeight/3.42;
  static double pageView4 = screenHeight/3.63;
  static double pageViewContainer = screenHeight/3.84;
  static double pageViewTextContainer = screenHeight/7.3;
//dynamic height for padding and margin
  static double height1 = screenHeight/305.5;
  static double height5 = screenHeight/105.5;
  static double height10 = screenHeight/84.4;
  static double height15 = screenHeight/63.3;
  static double height20 = screenHeight/42.2;
  static double height25 = screenHeight/35.0;
  static double height30 = screenHeight/28.2;
  static double height35 = screenHeight/25.13;
  static double height40 = screenHeight/21.3;
  static double height45 = screenHeight/18.76;
  static double height50 = screenHeight/13.1;


//dynamic width for padding and margin
  static double width5 = screenHeight/105.5;
  static double width10 = screenHeight/84.4;
  static double width15 = screenHeight/63.3;//56.27 used in tutorial
  static double width20 = screenHeight/42.2;
  static double width25 = screenHeight/35.0;// This one should be 21.1 according to my calculations
  static double width30 = screenHeight/28.2;//28.13 used in tutorial
  static double width35 = screenHeight/25.13;
  static double width40 = screenHeight/21.3;
  static double width45 = screenHeight/18.76;
  static double width50 = screenHeight/13.1;

  //font
  static double font32 = screenHeight/26.375;
  static double font30 = screenHeight/28.13;
  static double font28 = screenHeight/30.0;
  static double font26 = screenHeight/32.46;
  static double font24 = screenHeight/35.17;
  static double font22 = screenHeight/37.0;
  static double font20 = screenHeight/42.2;
  static double font15 = screenHeight/63.3;
  static double font10 = screenHeight/84.4;


//radius
  static double radius10 = screenHeight/70.0;
  static double radius15 = screenHeight/56.27;
  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;

  //icon
  static double iconSize32 = screenHeight/26.375;
  static double iconSize30 = screenHeight/28.13;
  static double iconSize28 = screenHeight/30.0;
  static double iconSize26 = screenHeight/32.46;
  static double iconSize24 = screenHeight/35.17;
  static double iconSize22 = screenHeight/37.0;
  static double iconSize20 = screenHeight/63.3;
  static double iconSize16 = screenHeight/52.75;


//list view size
  static double listViewImgSize = screenWidth/3.25;
  static double listViewTextContSize = screenWidth/3.9;

  //popular Services
  static double popularServicesImgSize = screenHeight/2.41;

  //bottom Height
  static double bottomHeightBar = screenHeight/7.03;

  //dots indicator position
  static double dotsIndicatorPositionV = (screenHeight/1.42);
  static double dotsIndicatorPositionH = (screenWidth/2)-(7+14+4+1);

  static double dotsPositionV = (screenHeight/1.42);
}