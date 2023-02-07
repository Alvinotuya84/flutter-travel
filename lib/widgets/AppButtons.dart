import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/widgets/smalltexts.dart';

class AppButtons extends StatelessWidget {
  String? txt;
  IconData? icon;
  final Color color;
  final Color backgroundColor;
  double sizeOfButton;
  final Color borderColor;
  bool IsIcon;

   AppButtons({Key? key,
  required this.backgroundColor,
   this.color=Colors.red,
  required this.sizeOfButton,
  required this.borderColor,
  required this.IsIcon,
   this.icon,
   this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(left: 2),
       width: sizeOfButton,
       height: sizeOfButton,
       child: IsIcon?Center(child: Icon(icon, color: color,)):Center(child: Center(child: SmallText(txt: txt!, color: color,))),
       decoration: BoxDecoration(
         border: Border.all(
           color: borderColor,
           width: 1.0
         ),
         borderRadius: BorderRadius.circular(8),
         color: backgroundColor
       ),
                  );
  }
}