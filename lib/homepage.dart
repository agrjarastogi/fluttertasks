// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.amber,
    Colors.indigo
  ];
  Color color = const Color.fromRGBO(100, 59, 79, 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = colorList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 3,
                    child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius:102.0,
                          child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                radius: 100.0,
                                
                                foregroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                              )),
                        ))),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Center(
                          child: Text('Agrja Rastogi',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Center(
                          child: Text('Flutter Developer',
                              style: TextStyle(fontSize: 15))),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        margin: EdgeInsets.all(3.5),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.phone, color: color),
                          ),
                        ))),
                Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        margin: EdgeInsets.all(3.5),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: TextFormField(
                            decoration: InputDecoration(
                          icon: Icon(
                            Icons.mail,
                            color: color,
                          ),
                        )))),
                Expanded(
                    flex: 1,
                    child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: colorList
                                .map((val) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        color = val;
                                      });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 3.0,
                                                style: BorderStyle.solid,
                                                color: Colors.black),
                                            color: val),
                                        height: 20.0,
                                        width: 20.0)))
                                .toList()),
                        padding: EdgeInsets.all(3.0)))
              ],
            )),
      ),
      backgroundColor: color,
    );
  }
}
