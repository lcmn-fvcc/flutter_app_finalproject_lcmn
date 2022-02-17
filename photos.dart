//Laura Mills Nelson
//CSCI 238_01 -- Standards-based Mobile Apps
//Final Project
//11/20/2020


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


//This is the Photos Page
class rPhotos extends StatefulWidget {
  @override
  _rPhotos createState() => _rPhotos();

}

class _rPhotos extends State<rPhotos> {

  //url comes from Lorem Picsum
  var url = "https://picsum.photos/250/300";

//future function to place in widget, telling it to await the url
  Future getPhotos() async {

    http.Response response = await http.get(url);
    var PhotoData = response.body;

    return PhotoData;

  }

  //variables to change the "Next Photo" button upon clicking
  IconData bIcon = Icons.navigate_next;
  String bttnText = "Next Photo";
  var bttnCounter = 0;

  //function to run when button is clicked -- stateful widget
  void _changeImage() {

    bttnCounter++;

    setState(() {

      //clear cache of previous image
      imageCache.clear();

      PhotoWidget(context);

      //change button display if clicked
      if (bttnCounter == 0)
        { bIcon = Icons.navigate_next;
          bttnText = "Next Photo"; }

      else if (bttnCounter > 0)
        { bIcon = Icons.check;
          bttnText = ""; }

    });


  }


//main widget to return photo data and text, or progress indicator
  Widget PhotoWidget(BuildContext context) {
    return FutureBuilder(
        future: getPhotos(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Widget myWidget;

          if (snapshot.hasData) {
            myWidget = Container(
                padding: EdgeInsets.only(
                    left: 20.0, top: 0.0, right: 20.0, bottom: 5.0),
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Life's Beauty",
                        textAlign: TextAlign.center,
                          style: TextStyle(
                             fontFamily: 'LoversQuarrel-Regular',
                              fontSize: 85),),
                      Padding(
                       padding: EdgeInsets.only(top: 5.0),
                      ),
                      Image.network(url),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      RaisedButton.icon(
                       onPressed: _changeImage,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0))),
                        label: Text(bttnText,
                          style: TextStyle(
                              color: Colors.white, fontSize: 20.0),),
                        icon: Icon(bIcon, color: Colors.white, size: 40,),
                        textColor: Colors.white,
                        splashColor: Colors.green,
                        color: Colors.black87,
                        //textColor: Colors.white,
                        padding: EdgeInsets.only(
                            left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text("After clicking Next Photo, continue on to another "
                          "page. Upon returning to the Photos page, a "
                          "new photo will appear.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic
                      ),),
                    ]
                )
            );
          } else if (snapshot.hasError) {
            myWidget = Text("${snapshot.error}");
          } else {
            myWidget = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  )
                ]),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("Retrieving Photo..."),
                )
              ],
            );
          }

          return myWidget;


        } // end of builder
    );
  }

  //return a scaffold -- creates the page structure
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //padding: EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  PhotoWidget(context),
                ])));
  }
}