import 'package:aero_next/userui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'allvalues.dart';
import 'defaultuser.dart';

String EmailID='';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Loginscreen();
  }
}
class Loginscreen extends StatefulWidget{
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> with TickerProviderStateMixin{
  AnimationController controller;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String loginid='';
  String password='';
  bool showspinner=false;
  Animation<double> animation;
  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Registration Successful",
            style: TextStyle(fontSize: 14),),
          content: Text(
            "Registration Succeeded! Go to login page and login to your account.",
            style: TextStyle(fontSize: 10,),),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showDialogCredentials() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Dirty Credentials",
            style: TextStyle(fontSize: 14),),
          content: Text(
            "Kindly check if the email and password are valid to register.",
            style: TextStyle(fontSize: 10,),),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List GetUserInformationbyEmail(String Email)
  {
    return(['Madhur Dheer',123965,'ABC Airlines']);
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Background_Color,
          appBar: AppBar(
            backgroundColor: Button_Color,
            title: Text('SmartFarm Account Login'),
          ),
          body: Column(
            children: <Widget>[
              SizedBox(height: 150,),
              Center(
                child: Container(
                  height: 60,width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),),
                  child: TextFormField(
                    style: LoginTextStyle,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 20, bottom: 20, top: 20, right: 20),
                      hintText: 'User-ID',hintStyle: LoginTextStyle.copyWith(
                      color: Colors.black38,
                    ),),
                    cursorColor: Colors.black,
                    onChanged: (text) {loginid = text;},

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  height: 60,width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),),
                  child: TextFormField(
                    obscureText: true,
                    style: LoginTextStyle,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 20, bottom: 20, top: 20, right: 20),
                      hintText: 'Password',hintStyle: LoginTextStyle.copyWith(
                      color: Colors.black38,
                    ),),
                    cursorColor: Colors.black,
                    onChanged: (text) {password = text;},

                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(width: 250,height:50,
                child: DecoratedBox(
                  decoration:
                  ShapeDecoration(shape:roundedrectangle, color:Button_Color),
                  child: OutlineButton(
                    color:Button_Color,
                    borderSide: BorderSide(color:Colors.white,),
                    shape: roundedrectangle,

                    child: Center(child: Text('Login',
                      style: TextStyle(color: Colors.white,),)),
                    onPressed: ()
                    async{
                      if (loginid.length<=1 || password.length<=6)
                        _showDialogCredentials();
                      else
                      {setState(() {
                        showspinner = true;
                      });
                      AuthResult result = await _auth.signInWithEmailAndPassword(
                          email: loginid, password: password);
                      //sendDatatoPHP(loginid);
                      EmailID=loginid;
                      List temporary=GetUserInformationbyEmail(loginid);
                      UserName=temporary[0];
                      setState(() {
                        showspinner = false;
                      });
                      if (result != null) {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>UserUI()),);
                      }
                      }

                      //Navigator.push(context,
                      //MaterialPageRoute(builder: (context)=>LoginScreen()),);
                    },
                  ),
                ),),


            ],
          ),
        ),
      ),
    );
  }
}

