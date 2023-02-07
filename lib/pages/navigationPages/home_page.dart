import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Cubit/app_cubit_states.dart';
import 'package:travel/Cubit/app_cubits.dart';
import 'package:travel/widgets/largetexts.dart';
import 'package:travel/widgets/normaltexts.dart';
import 'package:travel/widgets/smalltexts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var icons={
     Icons.access_alarm:"Alarm",
     Icons.account_balance_wallet_rounded:"Wallet",
     Icons.gamepad:"Gamepad",
     Icons.electric_bike:"Bike"
  };
  var places={
    "saritCenter.jpg":"saritCenter",
    "animal.jpg":"animals",
    "UhuruPark.jpg":"UhuruPark",
  };
  List iconColors=[
   Colors.red,
    Colors.grey,
    Colors.yellow,
   Colors.white
  ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController=TabController(length:3,vsync:this);
    return Scaffold(
      body:BlocBuilder<AppCubits ,CubitStates>(builder: (context,state){
        if(state is LoadedState){
      var collectedPlaces=state.places;
      return Column(
     children: [
       SafeArea(child:Container(
         padding: EdgeInsetsDirectional.all(12),
         child: Row(
           children: [
             Icon(
               Icons.menu,
               size: 30,
               color: Colors.grey,
             ),
             Expanded(child: Container()),
             Container(
               width: 30,
               height: 30,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: Colors.grey
               ),
             )
           ],
         ),
       )),
       SizedBox(height:20),
       Container(
         margin: const EdgeInsets.only(left:0),
              child:  LargeText(txt: "Discover More",color: Colors.black,)

       ),
       SizedBox(height:20),
       Container(
         
         child:  TabBar(
          indicator:  ShapeDecoration(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.orange
            ),
           labelColor: Colors.white,
           unselectedLabelColor: Colors.grey,
           isScrollable: true,
           controller: _tabController, 
           tabs: [
             Tab(
               text: "Tao",
             ),
             Tab(text: "Mjini",),
             Tab(text:"Nyumbani")
           ],
         ),

       ),
             Container(
               padding: const EdgeInsets.only(left:20),
               height: 300,
               width: double.maxFinite,
         child: TabBarView(
           
           controller: _tabController,
           
           children: [
             ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount:collectedPlaces.length,
               itemBuilder: (context ,index){
                 return  InkWell(
                   onTap: () {
                       BlocProvider.of<AppCubits>(context).getDetailsOfOnePlace(collectedPlaces[index]);
                   },
                   child: Container(
                     margin: const EdgeInsets.only(right: 15, top:15),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                   fit: BoxFit.fill,
                   image: NetworkImage(collectedPlaces[index].img)),),
                            ),
                 );
               },
             ),

           Text("There"),
           Text("Hello")
         ] 
         ),
       ),
        SizedBox(height:20),
       Container(
      margin: const EdgeInsets.only(left:20, right: 20),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NormalText(txt: "Mambo ndo hayo",color: Colors.black,),
          SmallText(txt: "see all", color:Colors.grey)
        ],
      ),
       ),
       SizedBox( height: 20,),
       Container(
         height: 120,
         width: double.maxFinite,
         margin: const EdgeInsets.only(left: 20),
         child: ListView.builder(
           scrollDirection: Axis.horizontal,
           itemCount: icons.length,
           itemBuilder: (context,index){
           return Container(
             margin: const EdgeInsets.only(right: 10),
             decoration: BoxDecoration(
               color: Color.fromARGB(255, 197, 197, 197),
               borderRadius: BorderRadius.circular(8)
             ),
             child: Column(
             children: [
               Container(
                margin: const EdgeInsets.only(right: 15, top:15),
                 width: 80,
                 height: 80,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8)
                 ),
                 child: Icon(
                   icons.keys.elementAt(index),
                   size: 40,
                   color:iconColors[index],
                 ),
               ),
               Container(
                 child: SmallText(txt: icons.values.elementAt(index), color: Colors.black,),
               )
             ],
           ),
           );
         }),
       )
 
     ],
      );
        }
        else{
          return Container();
        }
      },)
    );
  }
}
