

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'UPLOAD.dart';
void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      body: Column(
        children: <Widget>[
          SizedBox(
            height: 110,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "HOLA AMIGOS!",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Devtrons",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/notification.png",
                    width: 24,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
         img()
        ],
      ),
    );
  }
}