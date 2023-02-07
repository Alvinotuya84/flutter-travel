import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LargeText extends StatelessWidget {
  double sizeofTxt;
  final String txt;
  final Color color;
      LargeText({Key? key,
    required this.txt,
       this.color=Colors.white,
      this.sizeofTxt=30
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
           txt,
         style:TextStyle(
           color: color,
           fontSize: sizeofTxt,
           fontWeight: FontWeight.bold
         )
    );
  }
}