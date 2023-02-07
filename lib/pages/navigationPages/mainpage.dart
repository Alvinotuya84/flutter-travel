import 'package:flutter/material.dart';
import 'package:travel/pages/navigationPages/bar_1.dart';
import 'package:travel/pages/navigationPages/home_page.dart';
import 'package:travel/pages/navigationPages/my_page.dart';
import 'package:travel/pages/navigationPages/search_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages=[
    HomePage(),
    bar1(),
    SearchPage(),
    Mypage()
  ];
  int currentIndex=0;
  void onTap(int idx){
   setState(() {
     currentIndex=idx;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.apps),label:"Home"),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart),label:"Bar"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label:"Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label:"My"),


      ]),
    );
  }
}