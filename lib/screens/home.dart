import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:food_app/screens/add_your_card.dart';
import 'package:food_app/screens/item_carts.dart';
import 'package:food_app/screens/item_deails.dart';
import 'package:food_app/screens/signup_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  AnimationController _animationController;
  bool isPlaying = false;

  void _handelOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
  final callPage=[SignUpPage(),ItemDetails(),ItemCarts(),YourCard()];

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
      appBar:_currentIndex ==0? AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("What would you like to eat?"),
        actions: <Widget>[
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  size: 26.0,
                  color: Colors.black,
                ),
                onPressed: null,
              ),
              // Text("🔔",style: TextStyle(fontSize: 30,color: Colors.red),),
              Positioned(
                top: 12,
                right: 8,
                child: Text(
                  "14",
                  style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )
        ],
      ) : PreferredSize(preferredSize: Size(0.0,0.0),
      child: SizedBox(),
      ),
      body: _currentIndex ==0 ? Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: buildSearch(),
              flex: 0,
            ),
            Expanded(
              child: buildHoresintalList(),
              flex: 0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Popular Food  ➩ ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
              ),
              flex: 0,
            ),
            
            Expanded(
              child: buildPopularFood(),
              flex: 0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Best Food   ⇩ ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
              ),
              flex: 0,
            ),
            Expanded(
              child: buildBestFood(),
              flex: 1,
            )
          ],
        ),
      ): callPage[_currentIndex],
      bottomNavigationBar: _currentIndex ==0? BottomNavigationBar(
        elevation: 0,
        // selectedIconTheme: ,
        showUnselectedLabels: true,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.red),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        currentIndex: _currentIndex,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.store,
            ),
            title: Text(
              "Home",
            ),
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.gps_fixed),
              title: Text("Near By")),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,

              // icon: IconButton(
              //   padding: EdgeInsets.all(0),
              //   iconSize: 20,
              //   icon: AnimatedIcon(
              //     progress: _animationController,
              //     icon: AnimatedIcons.add_event,
              //   ),
              //   onPressed: () => _handelOnPressed(),
              // ),
              icon: Icon(Icons.shopping_cart),
              title: Text(
                "Cart",
              )),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.perm_identity,
              ),
              title: Text(
                "Account",
              )),
        ],
      ): SizedBox(),
    );
  }

  Widget buildSearch() {
    return Container(
      height: 45,
      width: 350,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            hintText: "Find a food or Restaurent",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.red,
            ),
            suffixIcon: Icon(Icons.filter_list, color: Colors.red)),
      ),
    );
  }

  Widget buildHoresintalList() {
    var serviceList = [
      {"name": "Sushi", "img": "img/su.png"},
      {"name": "Fast Food", "img": "img/fast.png"},
      {"name": "Fruits", "img": "img/fru.png"},
      {"name": "Protines", "img": "img/pro.png"},
      {"name": "Ice cream", "img": "img/ice.png"},
      {"name": "Sushi", "img": "img/burger.png"},
      {"name": "Sushi", "img": "img/burger.png"},
      {"name": "Sushi", "img": "img/burger.png"},
    ];
    return Container(
      height: 70,
      // width: 80,
      padding: EdgeInsets.all(0),
      child: ListView.builder(
        // padding: EdgeInsets.all(0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: serviceList.length,
        itemBuilder: (context, int index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Card(
                  elevation: 2,
                  child: Image.asset(serviceList[index]['img'],
                  // fit: BoxFit.scaleDown,
                  // width: MediaQuery.of(context).size.width/5.9 ,
                  ),
                ),
                flex: 5,
              ),
              Expanded(
                child: Text(serviceList[index]['name']),
                flex: 2,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildPopularFood() {
    var popularList = [
      {"name": "Sushi", "img": "img/z.jpg"},
      {"name": "Sushi", "img": "img/e.jpg"},
      {"name": "Sushi", "img": "img/burger.png"},
      // {"name": "Sushi", "img": "img/burger.png"},
    ];
    return Container(
      height: 200,
      child: ListView.builder(
        // padding: EdgeInsets.only(left:2,top:2 ),
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2, childAspectRatio: 0.8),
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: popularList.length,
        itemBuilder: (context, int index) {
          return Container(
            width: 180,
            height: 200,
            child: Card(
              elevation: 8,
              child: Column(              mainAxisAlignment: MainAxisAlignment.start,

                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      // fit: StackFit.expand,
                      // alignment: AlignmentDirectional.topEnd,
                      children: <Widget>[
                 
                        Image.asset(
                          popularList[index]['img'],
                          fit: BoxFit.cover,
                          // scale: 1.25,
                          width: MediaQuery.of(context).size.width / 0.6,
                          height: MediaQuery.of(context).size.height / 1.0,
                          // scale: 0.2,
                          // width: MediaQuery.of(context).size.width / 1.55,
                          // height: MediaQuery.of(context).size.height / 1.2,
                        ),


                               Positioned(
                          left: 150,
                          top: 10,
                          child:
                        
                           Container( 
                              padding: EdgeInsets.all(2.5),
                              decoration: ShapeDecoration(
                                shadows: [
                                  BoxShadow(color: Colors.grey, blurRadius: 4.0),
                                ],
                                shape: CircleBorder(),
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 13,
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Grilled salmon",
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Container(
                                padding: EdgeInsets.all(2.5),
                                decoration: ShapeDecoration(shadows: [
                                  BoxShadow(color: Colors.grey, blurRadius: 4.0)
                                ], shape: CircleBorder(), color: Colors.white),
                                child: Icon(
                                  Icons.near_me,
                                  color: Colors.red,
                                  size: 13,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("4.9", style: TextStyle(fontSize: 11)),
                            Icon(
                              Icons.star,
                              size: 12,
                              color: Colors.red,
                            ),
                            Icon(
                              Icons.star,
                              size: 12,
                              color: Colors.red,
                            ),
                            // Icon(Icons.star,size: 12,)
                            Icon(
                              Icons.star,
                              size: 12,
                              color: Colors.red,
                            ),
                            Icon(
                              Icons.star_border,
                              size: 12,
                              color: Colors.red,
                            ),
                            Text("(200)", style: TextStyle(fontSize: 10)),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "\$96.00",
                              style: TextStyle(fontSize: 11),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildBestFood() {
    var bestFoodList = [
      {"name": "Sushi", "img": "img/w.jpg"},
      {"name": "Sushi", "img": "img/w.jpg"},
      // {"name": "Sushi", "img": "img/burger.png"},
      // {"name": "Sushi", "img": "img/burger.png"},
    ];
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: bestFoodList.length,
      itemBuilder: (context, int index) {
        return Container(
          width: 300,
          height: 170,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    bestFoodList[index]['img'],
                  ),
                  fit: BoxFit.cover),
              // shape: ,
              border: Border.all(width: 4, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(18))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              ListTile(
                trailing: Container(
                  padding: EdgeInsets.all(4.5),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                    shadows: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 13,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
