import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ItemDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ItemDetailsState();
  }
}

class ItemDetailsState extends State<ItemDetails> with SingleTickerProviderStateMixin{
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
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 300));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: buildSwiper(context),
                  flex: 1,
                ),
                Expanded(
                  child: buildDetails(),
                  flex: 1,
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            showUnselectedLabels: true,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            selectedLabelStyle: TextStyle(color: Colors.black),
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
                  Icons.watch_later,
                  color: Colors.blue,
                ),
                title: Text(
                  "12am - 3pm",
                ),
              ),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(
                    Icons.gps_fixed,
                    color: Colors.green,
                  ),
                  title: Text("3.5km")),
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
                  icon: Icon(
                    Icons.map,
                    color: Colors.redAccent,
                  ),
                  title: Text(
                    "Map View",
                  )),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(
                    Icons.directions_car,
                    color: Colors.red[300],
                  ),
                  title: Text(
                    "Delivery",
                  )),
            ],
          )),
    );
  }

  Widget buildSwiper(BuildContext context) {
    var swiperList = [
      {"name": "Sushi", "img": "img/z.jpg"},
      {"name": "Sushi", "img": "img/e.jpg"},
      {"name": "Fruits", "img": "img/z.jpg"},
    ];
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Swiper(
          outer: false,
          itemCount: swiperList.length,
          itemBuilder: (context, int index) {
            return Image.asset(
              swiperList[index]['img'],
              fit: BoxFit.contain,
            );
          },
          autoplay: true,
          duration: 300,
          pagination: new SwiperPagination(
              margin: new EdgeInsets.all(5.0),
              builder: new DotSwiperPaginationBuilder(
                  color: Colors.grey, activeColor: Colors.red)),
          layout: SwiperLayout.DEFAULT,
          itemHeight: 300.0,
          itemWidth: 300.0,
        ),
        Positioned(
          top: 30,
          left: 6,
          child: Container(
            child: FlatButton(
              child: Icon(
                Icons.navigate_before,
                size: 35,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(),
                shadows: [
                  BoxShadow(blurRadius: 3, color: Colors.white),
                ]),
          ),
        ),
        Positioned(
          top: 30,
          right: 1,
          child: Container(
            child: FlatButton(
              child: Icon(
                Icons.shopping_cart,
                size: 25,
              ),
              onPressed: () {},
            ),
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(),
                shadows: [
                  BoxShadow(blurRadius: 3, color: Colors.white),
                ]),
          ),
        ),
        Positioned(
          top: 250,
          right: 1,
          child: Container(
            width: 100,
            height: 25,
            child: FlatButton(
              child: Icon(
                Icons.favorite,
                size: 20,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(),
                shadows: [
                  BoxShadow(blurRadius: 3, color: Colors.white),
                ]),
          ),
        ),
        Positioned(
          top: 55,
          right: 16,
          child: Container(
            width: 20,
            height: 25,
            child: Text(
              "2",
              style: TextStyle(
                  color: Colors.red, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(),
                shadows: [
                  BoxShadow(blurRadius: 3, color: Colors.white),
                ]),
          ),
        ),
      ],
    );
  }

  Widget buildDetails() {
    return ClipRect(
        clipBehavior: Clip.antiAlias,
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(blurRadius: 3, color: Colors.grey),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text("Grillded salmon"),
                subtitle: Text(" by Pizza hut"),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
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
                    SizedBox(
                      height: 12,
                    ),
                    Text("\$96.00")
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.maximize,
                      size: 21.5,
                    ),
                    onPressed: null,
                  ),
                  FlatButton(
                    child: Text(
                      "Add To Bag",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                    color: Colors.red,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.red,
                    ),
                    onPressed: null,
                  )
                ],
              ),
              Container(
                constraints: BoxConstraints.expand(height: 50),
                child: TabBar(
                  indicatorColor: Colors.red,
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.red,
                  tabs: <Widget>[
                    Tab(
                      text: "Detailes",
                    ),
                    Tab(
                      text: "Review",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                              "I made your . I used white  and your recipe was spot on. Fantastic.. I used white  and your recipe was spot on. Fantastic.. I used white  and your recipe was spot on. Fantastic. Thank you."),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                              "I made your . I used white  and your recipe was spot on. Fantastic... I used white  and your recipe was spot on. Fantastic. I used white  and your recipe was spot on. Fantastic.. Thank you."),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              //  Row(
              //           mainAxisSize: MainAxisSize.min,
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: <Widget>[
              //             FlatButton(
              //               child: Column(
              //                 mainAxisSize: MainAxisSize.min,
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: <Widget>[
              //                  Icon(Icons.help_outline,size: 20,),
              //                   Text("12am ",style: TextStyle(fontSize: 12),),
              //                 ],
              //               ),
              //               onPressed: () {},
              //             ),
              //             FlatButton(
              //               child: Column(
              //                 mainAxisSize: MainAxisSize.min,
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: <Widget>[
              //                   Icon(Icons.help_outline,size: 20,),
              //                   Text("12am ",style: TextStyle(fontSize: 12),),
              //                 ],
              //               ),
              //               onPressed: () {},
              //             ),
              //             FlatButton(
              //               child: Column(
              //                 mainAxisSize: MainAxisSize.min,
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: <Widget>[
              //                  Icon(Icons.help_outline,size: 20,),
              //                   Text("12am ",style: TextStyle(fontSize: 12),),
              //                 ],
              //               ),
              //               onPressed: () {},
              //             ),
              //             FlatButton(
              //               child: Column(
              //                 mainAxisSize: MainAxisSize.min,
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: <Widget>[
              //                  Icon(Icons.help_outline,size: 10,),
              //                   Text("12am ",style: TextStyle(fontSize: 5),),
              //                 ],
              //               ),
              //               onPressed: () {},
              //             ),
              //           ],
              //         ),
            ],
          ),
        ));
  }
}
