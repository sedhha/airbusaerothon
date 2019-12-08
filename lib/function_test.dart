import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class TestAllFunctions extends StatefulWidget {
  @override
  _TestAllFunctionsState createState() => _TestAllFunctionsState();
}

class _TestAllFunctionsState extends State<TestAllFunctions> {
  final _auth=FirebaseAuth.instance;
  final _firestore=Firestore.instance;
  String userID;
  void getCurrentUser()
  async{
    final user=await _auth.currentUser();
    if (user!=null)
      print('The user is logged in.');
    else
      print('The user is logged out');
  }
  String Email;
  String PNR;
  String Password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text('Testing Flutter'),
      ),
      backgroundColor: Colors.blue,
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Center(
            child: Container(
              width: 200.0,
              color: Colors.white,
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  backgroundColor: Colors.white,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Email'
                ),
                onChanged: (value){
                  Email=value;
                },
              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Container(
              width: 200.0,
              color: Colors.white,
              child: TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Password'
                ),
                onChanged: (value){
                  Password=value;
                },
              ),
            ),
          ),
          SizedBox(height: 20,),
          FlatButton(
            child: Text('Register'),
            color: Colors.green,
            onPressed: ()async{
              try{final newuser= await _auth.createUserWithEmailAndPassword(email: Email, password: Password);
              if(newuser!=Null)
                print(newuser.user);
              }
              catch(e)
              {
                print(e);
              }

            },
          ),
          SizedBox(height: 20,),
          FlatButton(
            child: Text('Sign In'),
            color: Colors.green,
            onPressed: ()async{
              try{final newuser= await _auth.signInWithEmailAndPassword(email: Email, password: Password);
              if(newuser!=Null)
                print('Login successful with ${newuser.hashCode}');
              //print('Congrats you have been logged in.');
              }
              catch(e)
              {
                print(e);
              }

            },
          ),
          SizedBox(height: 20,),
          FlatButton(
            color: Colors.green,
            child: Text('Check Authentication'),
            onPressed: getCurrentUser,
          ),
          Center(
            child: Container(
              width: 200.0,
              color: Colors.white,
              child: TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Text data'
                ),
                onChanged: (value){
                  PNR=value;
                },
              ),
            ),
          ),
          SizedBox(height: 20,),
          FlatButton(
            child: Text('Store Data'),
            color: Colors.green,
            onPressed: ()async{
              try{
                _firestore.collection('PNR').add({'ID':PNR,'CustomerName':'Adina',
                  'FlightName':'ABC Airlines','Email':Email});
              }
              catch(e)
              {
                print(e);
              }

            },
          ),
          SizedBox(height: 20,),
          FlatButton(
            child: Text('Sign Out'),
            color: Colors.green,
            onPressed: ()async{
              try{
                await _auth.signOut();
                print("Successfully Logged Out!");
              }
              catch(e)
              {
                print(e);
              }

            },
          ),
        ],
      ),
    );
  }
}