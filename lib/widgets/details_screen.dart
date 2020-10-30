
import 'package:dev_evil/Addition.dart';
import 'package:dev_evil/PDF/pdf.dart';
import 'package:dev_evil/widgets/youtube.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dev_evil/constants.dart';
import 'package:dev_evil/widgets/bottom_nav_bar.dart';
import 'package:dev_evil/widgets/search_bar.dart';
import 'package:firebase_database/firebase_database.dart';

//import 'package:dev_evil/Addition.dart';


class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.blue,

            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Additions",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "A life time course",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6,
                      child: Text(
                        "here in this course we are going to learn about aadditions \n                            -team devtrons" ,
                      ),
                    ),
                    SizedBox(
                      width: size.width * .9, // it just take the 50% width
                      child: SearchBar(),
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SeassionCard(
                          seassionNum: 1,

                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                               return Addition_Page();
                              }),
                            );
                          },
                        ),


                      ],
                    ),
                    SizedBox(height: 20),
                    FlatButton(
                      textColor: Color(0xFF6200EE),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return pdf();
                          }),
                        );

                      },
                      child: Text("pdf of quiz 1"),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/.svg",
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "QUIZ-1",
                                  style: Theme.of(context).textTheme.subtitle,
                                ),
                                Text("total marks awarded: 20")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),

                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  const SeassionCard({
    Key key,
    this.seassionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Session $seassionNum",
                      style: Theme.of(context).textTheme.subtitle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
