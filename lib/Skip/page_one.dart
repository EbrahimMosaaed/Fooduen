import 'package:flutter/material.dart';
import 'package:food_app/screens/signup_page.dart';

class PageOne extends StatelessWidget {
  final controllerr = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: controllerr,
      children: <Widget>[
        Container(
          child: Card(
            elevation: 20,
            child: Center(
              child: Text("3"),
            ),
            color: Colors.red,
          ),
        ),
        Container(
          child: Card(
            elevation: 10,
            child: Center(
              child: Text("3"),
            ),
            color: Colors.green,
          ),
        ),
        Container(
          child: Card(
            elevation: 5,
            child: Center(
              child: Text("3"),
            ),
            color: Colors.blue,
          ),
        ),
        SignUpPage()
      ],
      pageSnapping: false,
      physics: BouncingScrollPhysics(),
      // FlatButton(onPressed: (){},child: Text("skip"),)
    ));
  }
}
