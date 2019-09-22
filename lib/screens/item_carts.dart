import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemCarts extends StatefulWidget {
  @override
  _ItemCartsState createState() => _ItemCartsState();
}

class _ItemCartsState extends State<ItemCarts> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      systemNavigationBarColor: Colors.white, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ));

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).primaryColor,

      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildTitle(),
            Padding(
              padding: EdgeInsets.only(right: 200,top: 10),
              child: Text(
                "Your Food Cart",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            Expanded(
              child: buildCartItems(),
              flex: 1,
            ),
            Expanded(
              child: buildPromCode(),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      padding: EdgeInsets.only(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: ShapeDecoration(
                shape: CircleBorder(),
                shadows: [BoxShadow(blurRadius: 2, color: Colors.white)]),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: Icon(Icons.navigate_before,size: 30,),
            ),
          ),
          SizedBox(
            width: 80,
          ),
          Text("Item Carts",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
             SizedBox(
            width: 70,
          ),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_basket,
                  size: 26.0,
                  color: Colors.grey[500],
                ),
                onPressed: null,
              ),
              // Text("🔔",style: TextStyle(fontSize: 30,color: Colors.red),),
              Positioned(
                top: 25,
                right: 8,
                child: Text(
                  "4",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCartItems() {
    var itemCarts = [
      {"name": "Grilled salmon", 'price': '\$96.00', "img": "img/z.jpg"},
      {"name": "Pasta With ham", 'price': '\$70.00', "img": "img/e.jpg"},
    ];
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRect(
        clipBehavior: Clip.antiAlias,
        child: Container(
          width: 350,
          height: 120,
          child: ListView.builder(
            itemCount: itemCarts.length,
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                  height: 120,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white38),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      boxShadow: [
                        BoxShadow(blurRadius: 4, color: Colors.grey[100]),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 150,
                          width: 80,
                          decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              image: DecorationImage(
                                  image: AssetImage(
                                itemCarts[index]['img'],
                              ))),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Stack(
                          overflow: Overflow.visible,
                          fit: StackFit.loose,
                          children: <Widget>[
                            Container(
                              child: ListTile(
                                title: Text(
                                  itemCarts[index]['name'],
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(itemCarts[index]['price']),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.black,
                                  ),
                                  onPressed: null,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 60,
                              left: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.maximize,
                                      size: 15.5,
                                    ),
                                    onPressed: null,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 50,
                                    child: FlatButton(
                                      padding: EdgeInsets.all(0),
                                      child: Text(
                                        "Add To 2",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                      onPressed: () {},
                                      color: Colors.red,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.red,
                                      size: 15.5,
                                    ),
                                    onPressed: null,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildPromCode() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 20,
        width: 280,
        margin: EdgeInsets.all(10),
        color: Colors.white12,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Promo Code",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                borderSide: BorderSide(color: Colors.black26)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                borderSide: BorderSide(color: Colors.black26)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                borderSide: BorderSide(color: Colors.black26))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      child: FlatButton(
                        child: Text(
                          "Apply",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
              // Container(child: TextField(decoration: InputDecoration(

              //   hintText: "Subtotal",
              //   // suffixText: "\$ 680.00",
              //   suffix: Text("\$ 680.00",style: TextStyle(color: Colors.black),),
              //   enabled: true,
              //   border: OutlineInputBorder(),
              //   enabledBorder: InputBorder.none,
              //   disabledBorder: InputBorder.none,
              //   focusedBorder: InputBorder.none,

              // ),
              // autofocus: true,
              // )),
              Container(
                child: ListTile(
                  title: Text("Subtotal"),
                  trailing: Text("\$ 680.00"),
                ),
              ),
              Divider(
                height: 1.0,
              ),
              Container(
                child: ListTile(
                  title: Text("Shipping"),
                  trailing: Text("\$ 00.00"),
                ),
              ),
              Divider(
                height: 1.0,
              ),

              Container(
                child: ListTile(
                  title: Text("Total"),
                  trailing: Text("\$ 680.00"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
