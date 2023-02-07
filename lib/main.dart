import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Cubit/app_cubit_logics.dart';
import 'package:travel/Cubit/app_cubits.dart';
import 'package:travel/pages/home.dart';
import 'package:travel/pages/navigationPages/DetailPage.dart';
import 'package:travel/pages/navigationPages/mainpage.dart';
import 'package:travel/services/dataServices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(create: (context)=>AppCubits(
        data: DataServices()
      ),
      child: AppCubitLogics(),
      
      ),

    );
  }
}
