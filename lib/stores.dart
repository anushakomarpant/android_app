import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:android_app/utils/colors.dart';
import 'package:android_app/utils/dimensions.dart';
import 'package:android_app/popular_services_details.dart';
import 'package:android_app/utils/colors.dart';
import 'package:android_app/widgets/big_text.dart';
import 'package:android_app/widgets/small_text.dart';
import 'package:android_app/store_page_body.dart';
import 'package:android_app/product_scroll.dart';
import 'package:android_app/home/main_page_body.dart';
import 'package:android_app/grid_view.dart';
class Stores extends StatefulWidget {
  const Stores({Key? key}) : super(key: key);

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
          ),

          //showing the homePageBody
          const Expanded(
              child: SingleChildScrollView(
                //child: StorePageBody(),
                child: ProductScroll(),

              ),),
        ],
      ),
    );
  }
}
