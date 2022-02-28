// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city = "Lucknow";
  static TextEditingController _cityFieldController = TextEditingController();
  bool _attached = true;
  Map data = Map();
  double r1 = 0.0, r2 = 0.0, r3 = 0.0;

  @override
  void initState() {
    super.initState();
    city = "Lucknow";
    showStuff(city);
    _cityFieldController = TextEditingController(text: city);
  }

  Widget searchBar() {
    return Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(15.0),
        child: TextField(
          controller: _cityFieldController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  city = _cityFieldController.text;
                });
              },
            ),
            hintText: "Enter City",
            hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: TextStyle(color: Colors.white),
          onSubmitted: showStuff,
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: Text('Klimatic'),
          leading: IconButton(
              icon: Icon(Icons.cloud, color: Colors.white), onPressed: () {}),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            searchBar(),
            Stack(
              alignment: Alignment.center,
              children: [
                // ignore: sized_box_for_whitespace
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      value: data["main"]["humidity"] / 100,
                      strokeWidth: 10,
                      color: Colors.blue,
                    ),
                    height: 300,
                    width: 300,
                  ),
                ),
                Align(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      value: data["main"]["temp_max"] /
                          (data["main"]["temp_max"] + 10),
                      strokeWidth: 8,
                      color: Colors.red,
                    ),
                    height: 270,
                    width: 270,
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      value: data["main"]["temp_min"] /
                          (data["main"]["temp_min"] + 10),
                      strokeWidth: 6,
                      color: Colors.green,
                    ),
                    height: 240,
                    width: 240,
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  child: SizedBox(
                    child: Column(
                      children: [
                        Text(data["main"]["temp"].toString(),
                            style:
                                TextStyle(fontSize: 40.0, color: Colors.white),
                            textAlign: TextAlign.center),
                        RichText(
                            text: TextSpan(
                                text: "Humidity:",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.blue),
                                children: <TextSpan>[
                              TextSpan(
                                  text: data["main"]["humidity"].toString(),
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white))
                            ])),
                        RichText(
                            text: TextSpan(
                                text: "Max. Temp:",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.red),
                                children: <TextSpan>[
                              TextSpan(
                                  text: data["main"]["temp_max"].toString(),
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white))
                            ])),
                        RichText(
                            text: TextSpan(
                                text: "Min. Temp:",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.green),
                                children: <TextSpan>[
                              TextSpan(
                                  text: data["main"]["temp_min"].toString(),
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white))
                            ])),
                      ],
                    ),
                    height: 170,
                    width: 170,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Text(
          city.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 65.0, fontWeight: FontWeight.bold),
        ));
  }

  void showStuff(String city) async {
    setState(() {
      this.city = city;
    });
    Map data1 = await getWeather(apiID, city);
    setState(() {
      data = data1;
    });
    debugPrint(data1.toString());
  }

  Future<Map> getWeather(String apiId, String city) async {
    String apiURL =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiId&units=metric';

    Response response = await Dio().get(apiURL);
    debugPrint(response.data.toString());
    return response.data;
  }
}
