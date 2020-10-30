import 'package:dev_evil/teacher/UPLOAD.dart';
import 'package:flutter/material.dart';

void main() => runApp(button());

class button extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<button> with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('click below to add new course',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: GestureDetector(
                onTapDown: _onTapDown,
                onTapUp: _onTapUp,
                child: Transform.scale(
                  scale: _scale,
                  child: _animatedButtonUI,
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
    height: 70,
    width: 400,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x80000000),
            blurRadius: 30.0,
            offset: Offset(0.0, 5.0),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.yellow,
            Colors.orange,
          ],
        )),
    child: Center(
      child: Text(
        '+new course',
        style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    ),
  );

  void _onTapDown(TapDownDetails details) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => img()
      ),
    );
  }

  void _onTapUp(TapUpDetails details) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => img()
      ),
    );

  }
}