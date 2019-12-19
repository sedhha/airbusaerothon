import 'package:aero_next/allvalues.dart';
import 'package:flutter/material.dart';
import 'crop_specific.dart';
String Croptype='';
class MyCrops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Mycrops();
  }
}
class Mycrops extends StatefulWidget {
  @override
  _MycropsState createState() => _MycropsState();
}

class _MycropsState extends State<Mycrops> {

   List<Widget> CurrentWidgets=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background_Color,
      appBar: AppBar(
        backgroundColor: Button_Color,
        title: Text('MyCrops',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                color: Color(0xFFB2D3A3),
                height: 120,
                width: 150,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: FlatButton(
                    child: Image.asset('assets/images/button.png'),
                onPressed: (){
                      Croptype='maize';
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>CropSpecific()),);
                },),

              ),
              SizedBox(width: 10,),
              Container(
                color: Color(0xFFB2D3A3),
                height: 120,
                width: 150,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: FlatButton(
                  child: Image.asset('assets/images/wheat.png'),
                  onPressed: (){
                    Croptype='wheat';
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>CropSpecific()),);
                  },),

              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                color: Color(0xFFB2D3A3),
                height: 120,
                width: 150,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: FlatButton(
                  child: Image.asset('assets/images/gram.png'),
                  onPressed: (){
                    Croptype='gram';
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>CropSpecific()),);
                  },),

              ),
              SizedBox(width: 10,),
              Container(
                color: Color(0xFFB2D3A3),
                height: 120,
                width: 150,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: FlatButton(
                  child: Image.asset('assets/images/rice.png'),
                  onPressed: (){
                    Croptype='rice';
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>CropSpecific()),);
                  },),

              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                color: Color(0xFFB2D3A3),
                height: 120,
                width: 150,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: FlatButton(
                  child: Image.asset('assets/images/button.png'),
                  onPressed: (){
                    Croptype='maize';
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>CropSpecific()),);
                  },),

              ),
              SizedBox(width: 10,),
              Container(
                color: Color(0xFFB2D3A3),
                height: 120,
                width: 150,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: FlatButton(
                  child: Image.asset('assets/images/gram.png'),
                  onPressed: (){
                    Croptype='gram';
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>CropSpecific()),);
                    print('pushing');
                  },),

              ),
            ],
          ),

        ],
      ),
    );
  }
}

