import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:travel/Cubit/app_cubit_states.dart';
import 'package:travel/Cubit/app_cubits.dart';
import 'package:travel/pages/home.dart';
import 'package:travel/pages/navigationPages/DetailPage.dart';
import 'package:travel/pages/navigationPages/home_page.dart';
import 'package:travel/pages/navigationPages/mainpage.dart';

class AppCubitLogics extends StatefulWidget {
 const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context ,state){
        if(state is WelcomeState){
                    return Home();
        }
          else if(state is LoadingState){
          return Center(
            child:LoadingBouncingGrid.square(
              size: 100,
              backgroundColor: Colors.orange,
            ),
          );
        }
        else if(state is LoadedState){
         return MainPage();
        }
        else if (state is DetailState){
          return Details();
        }
        else{
          return Container();
        }
      }),
    );
  }
}