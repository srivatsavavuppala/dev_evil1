import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:dev_evil/profile/constants.dart';
import 'package:dev_evil/profile/list.dart';
import 'package:dev_evil/constants.dart';
import 'package:dev_evil/screens/home_page.dart';
import 'package:dev_evil/widgets/custom_btn.dart';
import 'package:dev_evil/widgets/custom_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(M());
}

class M extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: kDarkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: ProfileScreen(),
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      ScreenUtil.init(context, designSize: Size(414,896),allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[

          SizedBox(height: kSpacingUnit.w * 5),
          Text(
          'DEVTRONS',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * .5),
          Text(
         'have fun with learning',
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 20),
          Container(

            height: kSpacingUnit.w * 5,
            width: kSpacingUnit.w * 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
              color: Theme.of(context).accentColor,
            ),

            child: Center(

              child: Text(

                'home page',
                style: kButtonTextStyle,



              ),
            ),
          ),
        ],
      ),
    );

    var themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          crossFadeState:
          ThemeProvider.of(context).brightness == Brightness.dark
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
            child: Icon(
              LineAwesomeIcons.sun,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
          secondChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
            child: Icon(
              LineAwesomeIcons.moon,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
        );
      },
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        Icon(
          LineAwesomeIcons.arrow_left,
          size: ScreenUtil().setSp(kSpacingUnit.w * 3),
        ),
        profileInfo,
        themeSwitcher,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(

            body: Column(

              children: <Widget>[
                SizedBox(height: kSpacingUnit.w * 10),
                header,
                Expanded(
                  child: ListView(

                    children: <Widget>[

                      ProfileListItem(

                        icon: LineAwesomeIcons.alternate_sign_out,
                        text: 'Logout',


                        hasNavigation: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}