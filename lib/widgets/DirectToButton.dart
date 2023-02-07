import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/widgets/smalltexts.dart';

class DirectionButton extends StatelessWidget {

   String txt;
   final IconData? icon;
  double height;
  double width;
  final Color backgroundColor;
  final Color childColor;
   DirectionButton({Key? key,
   this.icon,
   this.txt="",
  required this.width,
  required this.height,
  required this.backgroundColor,
  required this.childColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        padding: const EdgeInsets.only( left: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          
        ),
        height: height,
        width: width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            SmallText(txt: txt),
            Icon(icon,color: childColor,),
          ]),
        ),
      ),
    );
  }
}