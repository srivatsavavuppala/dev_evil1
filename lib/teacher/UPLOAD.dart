import 'package:dev_evil/teacher/buttonai.dart';
import 'package:dev_evil/widgets/listt.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:dev_evil/widgets/listt.dart';
class img extends StatefulWidget {
  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<img> {
  TextEditingController _nameController, _numberController;
  String _typeSelected ='';

  DatabaseReference _ref;
  @override
  void initState() {

    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Contacts');
  }


  Widget _buildContactType(String title){

    return InkWell(

      child: Container(
        height: 40,
        width: 90,

        decoration: BoxDecoration(
          color: _typeSelected == title? Colors.green : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Center(child: Text(title, style: TextStyle(fontSize: 18,
            color: Colors.white),
        ),),),

      onTap: (){
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('courses'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'course',
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _numberController,
              decoration: InputDecoration(
                hintText: 'youtube link',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 15,),

            SizedBox(height: 25,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(child: Text('upload',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,

              ),),
                onPressed: (){
                saveContact();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Contacts()
                  ),
                );

                },

                color: Theme.of(context).primaryColor,
              ),
            )

          ],
        ),
      ),
    );
  }
  void saveContact(){

    String course = _nameController.text;
    String link = _numberController.text;

    Map<String,String> contact = {
      'name':course,
      'number': link,
      'type': _typeSelected,
    };

    _ref.push().set(contact).then((value) {

    });


  }
}
