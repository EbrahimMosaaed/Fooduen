import 'package:flutter/material.dart';
import 'package:food_app/Skip/page_one.dart';
import 'package:food_app/screens/add_your_card.dart';
import 'package:food_app/screens/home.dart';
import 'package:food_app/screens/item_carts.dart';
import 'package:food_app/screens/item_deails.dart';
import 'package:food_app/splash/animation_splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FOoduno',
      
      routes: {
        '/home': (context) => HomePage(),
        '/skipPage': (context) => PageOne(),
        '/itemsDeatils' :(context)=> ItemDetails(),
        '/itemCarts':(context)=> ItemCarts(),
        'YourCard':(context)=>YourCard(),
      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          textTheme: TextTheme(
              headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'))),
      home: HomePage(),
    );
  }
}
