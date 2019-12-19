import 'package:aero_next/allvalues.dart';
import 'package:flutter/material.dart';
import 'mycrops.dart';
class CropSpecific extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Cropspecific();
  }
}

class Cropspecific extends StatefulWidget {
  @override
  _CropspecificState createState() => _CropspecificState();
}

class _CropspecificState extends State<Cropspecific> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Specific Details'),
        backgroundColor: Button_Color,
      ),
      backgroundColor: Color(0xFFA2CC8F),
      body: Center(
          child: Container(
          height:double.infinity,
          width: double.infinity,
          child: Croptype==null?Container():Image.asset('assets/images/${Croptype}_details.png',fit: BoxFit.cover,))),
    );
  }
}

