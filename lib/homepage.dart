// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'home_page_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Events app")),
      body: ListView(children: <Widget>[
        HomePageBackground(screenHeight: MediaQuery.of(context).size.height),
        for(int i=1;i<=10;i++)
          EventCard()
      ]),
    );
  }
}

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green[400],
          /* border: Border(
                left: BorderSide(
                  color: Colors.green,
                  width: 3,
                ),
              ), */
        ),
        child: Row(children: <Widget>[
          Flexible(
            flex: 1,
            child:ClipRRect(borderRadius: BorderRadius.circular(35.0),
              child: Image.asset('assets/img.jpeg')
              ),
          ),
          Flexible(
            flex: 2,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("Event 1",
                        style: TextStyle(
                            fontSize: 20.2, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right),
                  ),
                  Container(
                    child: Text("Date and time: 12/34/56, 12:00am",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  Text("Manipal",
                      style: TextStyle(
                          fontSize: 20.2, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ]),
          )
        ]));
  }
}
