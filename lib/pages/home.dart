

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Cubit/app_cubits.dart';
import 'package:travel/widgets/largetexts.dart';
import 'package:travel/widgets/normaltexts.dart';
import 'package:travel/widgets/responsiveButton.dart';
import 'package:travel/widgets/smalltexts.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List appImages=[
    "forest.jpg",
    "I&M.jpg",
    "nairobi.jpg",
    "upperhill.jpg"

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView.builder(
       scrollDirection: Axis.vertical ,
       itemCount:appImages.length,
        itemBuilder: (context, index) {
        return Container(
          width: double.maxFinite,
          height:double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
               "assets/images/" + appImages[index]
              ),
              fit:BoxFit.cover
              )
          ),
          child: Container(
            margin: const EdgeInsets.only(top:150, left:20, right:20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LargeText(txt: "Kuja Kanairo"),
                    NormalText(txt: "Maisha raha huku kanairo mse"),
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      child: SmallText(txt: "Nairobi has existed since 18's and has always had that beautiful scenery that's why"),
                     


                      
                    ),
                    SizedBox(height: 20,),
                   MaterialButton(
                     color: Colors.orange,
                     onPressed: (){
                     BlocProvider.of<AppCubits>(context).getData();
                   }, child: Text(
                     "Check This out",
                     style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                     ),
                     
                     )
                     
                     
                   
                  ],
                ),

                Column(
                  children: List.generate(4, (indexSlider){
                    return Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      width: 8,
                      height: index==indexSlider?30:10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:index==indexSlider? Colors.orange:Colors.white
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        );
      },)
    );
  }
}