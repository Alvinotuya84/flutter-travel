
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
   ResponsiveButton({Key? key,
    this.isResponsive=true,
    this.width
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      
  onPressed: () {
      // Respond to button press
  },
  
  label: Text(""),
  icon: Icon(Icons.arrow_right, size: 50,),
 style: ElevatedButton.styleFrom(
                        elevation: 15.0,
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),)

);
  }
}