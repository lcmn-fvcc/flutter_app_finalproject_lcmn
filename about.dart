//Laura Mills Nelson
//CSCI 238_01 -- Standards-based Mobile Apps
//Final Project
//11/20/2020


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


//this is the About page
class iAbout extends StatefulWidget {
  @override
  _iAbout createState() => _iAbout();
}

class _iAbout extends State<iAbout> {

  //photo of rainbow and mountains
  Widget rainbow = Padding(
    padding: EdgeInsets.only(
        left: 10.0, right: 10.0, top: 10.0, bottom: 40.0),
    child: Image.asset("images/rainbow.jpg"),
  );

  //widget that returns the Text and image on the page
  Widget wiAbout(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("About:",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'LoversQuarrel-Regular',
                fontSize: 85),
          ),
          rainbow,
          Text("The Inspiration App seeks to offer a "
              "moment of reflection in your daily life. Our purpose "
              "is to inspire you to appreciate life's small beauties and "
              "to live your life thoughtfully and with gratitude.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0
            ),
          ),
        ]));

  }


  //return a scaffold -- this is the page structure
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(20.0),
            child:
            Center(child: ListView(
                children: <Widget>[
                  wiAbout(context),
                ]
            )
            )
        )
    );
  }
}
