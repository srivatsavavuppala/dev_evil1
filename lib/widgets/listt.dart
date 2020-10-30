import 'package:dev_evil/teacher/UPLOAD.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';


class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  Query _ref;


  @override
  void initState() {

    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('ytlink')
        .orderByChild('name');
  }
  

  Widget _buildContactItem({Map contact}) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add new'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map contact = snapshot.value;
            return _buildContactItem(contact: contact);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) {
              return img();
            }),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Color getTypeColor(String type) {
    Color color = Theme.of(context).accentColor;

    if (type == 'Work') {
      color = Colors.brown;
    }

    if (type == 'Family') {
      color = Colors.green;
    }

    if (type == 'Friends') {
      color = Colors.teal;
    }
    return color;
  }
}
