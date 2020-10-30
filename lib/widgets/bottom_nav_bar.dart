import 'package:dev_evil/calendar.dart';
import 'package:dev_evil/profile/p.main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dev_evil/constants.dart';
import 'package:dev_evil/screens/login_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 70,
      color: Colors.lightBlue[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[


          BottomNavItem(
            title: "schedule",
            svgScr: "assets/icons/calendar.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => calendar()
                ),
              );
            },

          ),
          BottomNavItem(

            title: "LOGOUT",
            svgScr: "assets/icons/88.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage()
                ),
              );
            },



          ),
          BottomNavItem(
            title: "profile",
            svgScr: "assets/icons/avatar.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>M()
                ),
              );
            },

          ),

        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final Function press;
  final bool isActive;
  const BottomNavItem({
    Key key,
    this.svgScr,
    this.title,
    this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgScr,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}
