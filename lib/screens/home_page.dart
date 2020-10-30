import 'package:dev_evil/profilemain.dart';
import 'package:dev_evil/services/firebase_services.dart';
import 'package:dev_evil/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dev_evil/constants.dart';
import 'package:dev_evil/widgets/details_screen.dart';
import 'package:dev_evil/widgets/bottom_nav_bar.dart';
import 'package:dev_evil/widgets/category_card.dart';
import 'package:dev_evil/widgets/search_bar.dart';
import 'package:dev_evil/profile/p.main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseServices _firebaseServices = FirebaseServices();

  PageController _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(

      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
          height: size.height * .40,
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/00.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child:FlatButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => M()),
                            );
                          },
                          padding: EdgeInsets.all(0.0),
                          child: SvgPicture.asset("assets/icons/987.svg")) ,
                    ),
                  ),
                  /*

  );
                   */
                  Text(
                    "",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 15,
                      children: <Widget>[
                        CategoryCard(
                          title: "real numbers",
                          svgSrc: "assets/icons/9.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "integers",
                          svgSrc: "assets/icons/9.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "additions",
                          svgSrc: "assets/icons/9.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "substractions",
                          svgSrc: "assets/icons/9.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "multiplications",
                          svgSrc: "assets/icons/9.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "divisions",
                          svgSrc: "assets/icons/9.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}