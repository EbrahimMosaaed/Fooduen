import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class YourCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            buildTitle(context),
            Expanded(child: buildSwiper()),
            buildInfo(),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
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
              icon: Icon(
                Icons.navigate_before,
                size: 30,
              ),
            ),
          ),
          SizedBox(
            width: 80,
          ),
          Text(
            "Add Your Card ",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 70,
          ),
        ],
      ),
    );
  }

  Widget buildSwiper() {
    var swiperList = [
      {"name": "Sushi", "img": "img/23.jpg"},
      {"name": "Sushi", "img": "img/33.jpg"},
      // {"name": "Fruits", "img": "img/34.jpeg"},
      {"name": "Fruits", "img": "img/35.png"},
    ];
    return Swiper(
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
    );
  }
  Widget buildInfo() {
    return ClipRect(
      clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(color: Colors.white,
            border: Border.all(width: 2,color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(23)),
              boxShadow: [BoxShadow(blurRadius: 5,color: Colors.grey[200])]
            ),
        width: 300,
        // height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text("CARDHOLDER NAMES"),
              subtitle: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            ),
            ListTile(
              title: Text("CARD NUMBER"),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("EXPIRATION DATE"),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    flex: 2,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("CVV/CVC "),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "3 or 4 digit code",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: FlatButton(
                child: Text(
                  "Save my credentails",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
