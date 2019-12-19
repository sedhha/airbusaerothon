import 'package:aero_next/register.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'allvalues.dart';
import 'login.dart';
class WelcomeUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WelcomeScreen();
  }
}
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
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
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Image.asset('assets/images/farm.png'),
            SizedBox(height: 10,),
            Center(
              child: TypewriterAnimatedTextKit(
                text: ["Smart Farm"],
                textStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(width: 250,height:50,
              child: DecoratedBox(
                decoration:
                ShapeDecoration(shape:roundedrectangle, color:Button_Color),
                child: OutlineButton(
                  color:Button_Color,
                  borderSide: BorderSide(color:Colors.white,),
                  shape: roundedrectangle,

                  child: Center(
                      child: Text(
                        'Login',style: TextStyle(
                          color: Colors.white),)),
                  onPressed: ()
                  {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>LoginScreen()),);
                  },
                ),
              ),),
            SizedBox(height: 40,),
            Container(width: 250,height:50,
              child: DecoratedBox(
                decoration:
                ShapeDecoration(shape:roundedrectangle, color:Button_Color),
                child: OutlineButton(
                  color:Button_Color,
                  borderSide: BorderSide(color:Colors.white,),
                  shape: roundedrectangle,

                  child: Center(
                      child: Text(
                        'Register',style: TextStyle(
                          color: Colors.white),)),
                  onPressed: ()
                  {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>RegisterScreen()),);
                  },
                ),
              ),),



          ],
        ),
        backgroundColor: Background_Color,
      ),
    );
  }
}
/*SizedBox(height: 10,),
Center(
child: TyperAnimatedTextKit(
text: ["Flight Booking"],
textStyle: TextStyle(
color: Colors.white,
fontFamily: 'Montserrat',
fontWeight: FontWeight.w600,
fontSize: 25,
),
),
),*/
