import 'package:flutter/material.dart';

class HomePageBackground extends StatelessWidget {
  final screenHeight;

  const HomePageBackground({Key? key, @required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      child:Center(
        child:Text("Events", style:TextStyle(fontSize: 100.1 ))
      ),
      color: themeData.primaryColor, height: screenHeight * 0.3);
  }
}
