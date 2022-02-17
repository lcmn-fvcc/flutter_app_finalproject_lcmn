//Laura Mills Nelson
//CSCI 238_01 -- Standards-based Mobile Apps
//Final Project
//11/20/2020

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//this is the "Home Page" -- the page that shows first when the app loads
class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();

}

class _HomePage extends State<HomePage> {

  //the widget that contains the beginning Text content/header
  HomePageWidget(context) {
    return Container(
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Text("Welcome to the",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              Text(" "),
              Text("Inspiration App",
                style: TextStyle(
                  fontFamily: 'LoversQuarrel-Regular',
                    fontSize: 85),
                textAlign: TextAlign.center,
              ),
            ]
        )
    );
  }//end of Widget

  //photo widget for Home Page Photo
  Widget stars = Padding(
    padding: EdgeInsets.only(
        left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
    child: Image.asset("images/stars.jpg"),
  );

  //text widget for directions about the app
  Widget directions = Padding(
    padding: EdgeInsets.only(top: 30.0),
    child: Text("Use the navigation bar below to view beautiful "
        "images, thoughtful words, and to \nlearn more about \nThe "
        "Inspiration App",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25.0,
        fontStyle: FontStyle.italic,
      ),
    ),
  );

  //scaffold that displays the content of the Home Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
              padding: EdgeInsets.all(20.0),
              child: Center(
                  child: Column(
                      children: <Widget>[
                        HomePageWidget(context),
                        stars,
                        directions
                      ]
                  )
              )
          ),
        );
  }



}//end of class