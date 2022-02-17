//Laura Mills Nelson
//CSCI 238_01 -- Standards-based Mobile Apps
//Final Project
//11/20/2020

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//these are the other pages/files imported for navigational purposes
import './photos.dart';
import './quotes.dart';
import './about.dart';
import './home.dart';


/*
Add to pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  http: ^0.12.2

  flutter:
  fonts:
    - family: LoversQuarrel
      fonts:
        - asset: google_fonts/LoversQuarrel-Regular.ttf

*/

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyApp();
  }
}

//this class links all of the imported pages to the navigation structure
class _MyApp extends State<MyApp> {

  int _selectedIndex = 0;
  final _indexOptions = [

    HomePage(),
    rPhotos(),
    rQuotes(),
    iAbout()

  ];

//these are the individual Nav Bar items
  BottomNavigationBarItem myBItem1() {
    return BottomNavigationBarItem(
        backgroundColor: Colors.deepPurple[700],
        icon: Icon(Icons.home),
        title: Text("Home",
        style: TextStyle(
          fontSize: 15.0
        ),)
    );
  }

  BottomNavigationBarItem myBItem2() {
    return BottomNavigationBarItem(
      backgroundColor: Colors.deepPurple[700],
      icon: Icon(Icons.photo_camera),
      title: Text("Photos",
        style: TextStyle(
          fontSize: 15.0
        ),
      ),
    );
  }

  BottomNavigationBarItem myBItem3() {
    return BottomNavigationBarItem(
        backgroundColor: Colors.deepPurple[700],
        icon: Icon(Icons.format_quote),
        title: Text("Quotes",
        style: TextStyle(
          fontSize: 15.0)
        )
    );
  }

  BottomNavigationBarItem myBItem4() {
    return BottomNavigationBarItem(
        backgroundColor: Colors.deepPurple[700],
        icon: Icon(Icons.help_outline),
        title: Text("About",
        style: TextStyle(
          fontSize: 15.0
        ),));
  }


//this is the AppBar and BottomNavBar structure that appears on all pages
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
          child: AppBar(
          centerTitle: true,
          title: Text("The Inspiration App",
          style: TextStyle(
            fontSize: 30.0
          ),),
          backgroundColor: Colors.deepPurple,
        )),
        body: _indexOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.tealAccent,
          backgroundColor: Colors.deepPurple,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            myBItem1(),
            myBItem2(),
            myBItem3(),
            myBItem4()
          ],
        )));
  }
}


