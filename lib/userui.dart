import 'package:aero_next/bookaflight.dart';
import 'package:aero_next/defaultuser.dart';
import 'package:aero_next/special_offers.dart';
import 'package:aero_next/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'allvalues.dart';
import 'bookinghistory.dart';
import 'user.dart';
import 'completebookingdetails.dart';
class UserUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserUIs();
  }
}
class UserUIs extends StatefulWidget {
  @override
  _UserUIsState createState() => _UserUIsState();
}
Widget BookingWidegtTree;
List<Widget> CompleteBookingWidgetTree;
class _UserUIsState extends State<UserUIs>
    with TickerProviderStateMixin{
  AnimationController controller;
  final FirebaseAuth _auth=FirebaseAuth.instance;
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
  List getAllFlightDetailsOfUser()
  {
    //TODO: Make http request and get the data


    return(UserFlightDetailsIds);
  }
  void GenerateWidgetTree()
  {
    for(int i in UserFlightDetailsIds)
      {
         Widget PushButtons=Container(width: double.infinity,height:50,
           child: DecoratedBox(
             decoration:
             ShapeDecoration(shape:roundedrectangle, color:Colors.white),
             child: OutlineButton(
               color:Button_Color,
               borderSide: BorderSide(color:Background_Color,),
               shape: roundedrectangle,

               child: Text('$i'),
               onPressed: ()
               {

                 Navigator.push(context,
                   MaterialPageRoute(builder: (context)=>CompleteBookingDetails()),);                 //Navigator.push(context//MaterialPageRoute(builder: (context)=>LoginScreen()),);
               },
             ),
           ),);
         if(PushButtons!=null)
         CompleteBookingWidgetTree.add(PushButtons);
         else
           print('Null aa rha hai bhai!!!');
      }
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Scaffold(
        backgroundColor: Background_Color,
        appBar: AppBar(
          backgroundColor: Button_Color,
          title: Text('Welcome User!'),
          actions: <Widget>[
            FlatButton.icon(onPressed: ()async{
              await _auth.signOut();
              Navigator.push(context,
                MaterialPageRoute(
                    builder: (context)=>WelcomeScreen()),);
            },
                icon: Icon(Icons.perm_identity), label: Text('Logout')),
          ],
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(width: 20,),
                Container(
                  width: 100,height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/user.png'),
                    )
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Text(EmailID),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      color: Colors.white,
                      child: Text(UserName),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 120,),
            Container(width: 250,height:50,
              child: DecoratedBox(
                decoration:
                ShapeDecoration(shape:roundedrectangle, color:Button_Color),
                child: OutlineButton(
                  color:Button_Color,
                  borderSide: BorderSide(color:Colors.white,),
                  shape: roundedrectangle,

                  child: Center(child: Text('Booking History',
                    style: TextStyle(color: Colors.white,),)),
                  onPressed: ()
                  {
                    GenerateWidgetTree();
                    print('Here we go:${CompleteBookingWidgetTree.length}');
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>BookingHistory()),);                 //Navigator.push(context//MaterialPageRoute(builder: (context)=>LoginScreen()),);
                  },
                ),
              ),),
            SizedBox(height: 20,),
            Container(width: 250,height:50,
              child: DecoratedBox(
                decoration:
                ShapeDecoration(shape:roundedrectangle, color:Button_Color),
                child: OutlineButton(
                  color:Button_Color,
                  borderSide: BorderSide(color:Colors.white,),
                  shape: roundedrectangle,

                  child: Center(child: Text('Book a Flight',
                    style: TextStyle(color: Colors.white,),)),
                  onPressed: ()
                  {
                    //UserFlightDetails=getAllFlightDetailsOfUser();
                    //GenerateWidgetTree();
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>BookAFlight()),);                 //Navigator.push(context//MaterialPageRoute(builder: (context)=>LoginScreen()),);
                  },
                ),
              ),),
            SizedBox(height: 20,),
            Container(width: 250,height:50,
              child: DecoratedBox(
                decoration:
                ShapeDecoration(shape:roundedrectangle, color:Button_Color),
                child: OutlineButton(
                  color:Button_Color,
                  borderSide: BorderSide(color:Colors.white,),
                  shape: roundedrectangle,

                  child: Center(child: Text('Special Offers',
                    style: TextStyle(color: Colors.white,),)),
                  onPressed: ()
                  {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>SpecialOffers()),);                 //Navigator.push(context//MaterialPageRoute(builder: (context)=>LoginScreen()),);
                  },
                ),
              ),),
          ],
        ),
      ),
    );
  }
}

