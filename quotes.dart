//Laura Mills Nelson
//CSCI 238_01 -- Standards-based Mobile Apps
//Final Project
//11/20/2020


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//This is the quotes page
class rQuotes extends StatefulWidget {
  @override
  _rQuotes createState() => _rQuotes();

}

class _rQuotes extends State<rQuotes> {

  //future function to tell the widget to await the API
  Future getQuote() async {
    var url = "https://api.quotable.io/random";
    http.Response response = await http.get(url);
    var QuoteData = jsonDecode(response.body);

    return QuoteData;
  }

//main widget to return quote data and rest of page, or progress indicator
  Widget QuoteWidget(BuildContext context) {
    return FutureBuilder(
        future: getQuote(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Widget myWidget;

          if (snapshot.hasData) {
            myWidget = Container(
                child: Column(
                    children: [
                    Text("Wise Words",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'LoversQuarrel-Regular',
                            fontSize: 85),
                    ),
                    Image.asset("images/starlights.jpg"),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                      ),
                    Text("${snapshot.data['content']}",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    Text(" "),
                    Text("-----"),
                    Text(" "),
                    Text("${snapshot.data['author']}",
                      style: TextStyle(
                          fontSize: 25, fontStyle: FontStyle.italic)),
                          ])
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
                  child: Text("Retrieving Quote..."),
                )
              ],
            );
          }

          return myWidget;
        } // end of builder
    );
  }

  //return a scaffold -- main structure of the page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => ListView(
            children: [
              Container(
              padding: const EdgeInsets.all(20.0),
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Center(
                    child: QuoteWidget(context),
                ),
              )
            ],
          ),
        ),
    );
  }
}