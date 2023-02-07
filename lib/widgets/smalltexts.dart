import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SmallText extends StatelessWidget {

  final String txt;
  double sizeOftxt;
  final Color color;


   SmallText({Key? key,
   required this.txt,
   this.sizeOftxt=15,
   this.color=Colors.white,
  

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        color: color,
        fontWeight:FontWeight.w400,
        fontSize: sizeOftxt
      ),

    );
  }
}