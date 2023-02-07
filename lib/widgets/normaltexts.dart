import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NormalText extends StatelessWidget {

 double sizeOftxt;
 final String txt;
 final Color color;
   NormalText({Key? key,
   required this.txt,
   this.sizeOftxt=20,
   this.color=Colors.white
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: sizeOftxt,
        color: color
      ),

    );
  }
}