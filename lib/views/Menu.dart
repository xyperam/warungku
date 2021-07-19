import 'package:flutter/material.dart';

import 'home.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  padding: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                      color: Color(0xFF4150A8), // EDIT COLOR HERE
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(200),
                          bottomRight: Radius.circular(200))),
                  child: Text('WarungKu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),

// Layout 1
            Row(
              children: <Widget>[
// Menu 1 Start
                Container(
                  margin: EdgeInsets.only(
                      top: 45.0, bottom: 0.0, left: 5.0, right: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () => {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Home();
                            }))
                          },
                        ),
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(30.0),
                            image: DecorationImage(
                              image: new AssetImage('assets/sembako.jpg'),
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            )),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Sembako",
                        style: TextStyle(fontFamily: 'Varela', fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
//Menu 1 End
              ],
            ),
          ],
        )
      ],
    ));
  }
}
