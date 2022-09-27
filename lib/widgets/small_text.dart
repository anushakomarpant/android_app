import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  double height;
  SmallText({Key? key, this.color = const Color(0xFF332d2b),
    required this.text,
    this.size=12,
    this.overFlow=TextOverflow.ellipsis,
    this.height=1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        overflow:overFlow,
        style: TextStyle(
            fontFamily: 'Roboto',
            color:color,
            fontSize: size,
            fontWeight: FontWeight.w400,
            height: height
        )
    );
  }
}
