import 'dart:async';

import 'package:flutter/material.dart';

class ImageSplashScreen extends StatefulWidget {
  @override
  _ImageSplashScreenState createState() => _ImageSplashScreenState();
}

class _ImageSplashScreenState extends State<ImageSplashScreen> {
startTime() async{
var _duration=Duration(seconds: 4);
return Timer(_duration, navigationPage);
}

void navigationPage(){
  Navigator.of(context).popAndPushNamed('/home');
}
@override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand,children: <Widget>[Image.asset('img/burger.png')],),
    );
  }
}