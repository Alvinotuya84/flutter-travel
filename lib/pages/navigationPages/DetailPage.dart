import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Cubit/app_cubit_states.dart';
import 'package:travel/Cubit/app_cubits.dart';
import 'package:travel/widgets/AppButtons.dart';
import 'package:travel/widgets/DirectToButton.dart';
import 'package:travel/widgets/largetexts.dart';
import 'package:travel/widgets/normaltexts.dart';
import 'package:travel/widgets/smalltexts.dart';

class Details extends StatefulWidget {
  Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int gottenStars=4;
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if(state is DetailState){
        var placeDetails=state.place;
        gottenStars=placeDetails.rating;
        return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit:  BoxFit.fill,
                  image: NetworkImage(placeDetails.img)
                )
              ),
            )),
                Positioned(
              left: 20,
              top: 70,
              child: Row(
              children:[
                IconButton(onPressed: (){
                  BlocProvider.of<AppCubits>(context).goHome();
                }, icon: Icon(Icons.home, color: Colors.white,))
              ]
            )),
            Positioned(
              top: 330,
              child: Container(
                padding: EdgeInsets.only(left:20, right:20,top: 20),
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: BoxDecoration(
                
                color:Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              child: Column(
                children: [
                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      NormalText(txt: placeDetails.name +" National Park", color: Colors.black,),
                      NormalText(txt: "Ksh "+ placeDetails.price, color: Colors.orange,),
                      
                    ]
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 20,),
                      SmallText(txt: placeDetails.location, color: Colors.black,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                    Wrap(
                    children: 
                      List.generate(5, (index) =>
                      Icon(Icons.star, color: gottenStars<=index?Colors.grey:Colors.yellow))
                    
                  ),
                  SmallText(txt: "(4.0)",color: Colors.black,)
                    ],
                  ),
                  SizedBox(height:20),
                  Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NormalText(
               txt: "People",
               color: Colors.black,
              ),
              SizedBox(height:20),
              SmallText(txt: "The place is always good", color: Colors.black,),
              Wrap(
                children: 
                  List.generate(4, (index) =>InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex=index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10,top: 10),
                      child: AppButtons(backgroundColor: selectedIndex==index?Colors.black:Color.fromARGB(255, 213, 212, 212), sizeOfButton: 60, borderColor: Color.fromARGB(255, 213, 212, 212), IsIcon: false,txt: (index +1).toString(), color: selectedIndex==index?Colors.white:Colors.black,)),
                  ) ),
              ),
              SizedBox(height: 10,),
              LargeText(txt: "Description", color: Colors.black,),
              SizedBox(height: 10,),
              SmallText(txt: placeDetails.description, color: Colors.black,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButtons(backgroundColor: Colors.white, sizeOfButton: 60, borderColor: Colors.orange, IsIcon: true, icon: Icons.favorite_border, color: Colors.orange,),
                  DirectionButton(width: 120, height: 60, backgroundColor: Colors.orange, childColor: Colors.white, icon: Icons.arrow_right,txt: "Book Now",)
                ],
              )
                ],
              )
                          )

                ]
              )
            ))
          ],

        ),
      ),
    );}
    else{
      return Container();
    }
      
    },);
  }
}