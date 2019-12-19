import 'package:aero_next/userui.dart';
import 'package:flutter/material.dart';
class BookingHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Bookinghistory();
  }
}
class Bookinghistory extends StatefulWidget {
  @override
  _BookinghistoryState createState() => _BookinghistoryState();
}


class _BookinghistoryState extends State<Bookinghistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking History'),),
      body: ListView(
        children: <Widget>[
          Text('ABC Airlines:11002',
          style: TextStyle(fontSize: 40,),),
          SizedBox(height: 20,),
          Text('XYZ Airlines:14002',
            style: TextStyle(fontSize: 40,),),
          SizedBox(height: 20,),
          Text('saf Airlines:11002',
            style: TextStyle(fontSize: 40,),),
          SizedBox(height: 20,),
          Text('awdrgd Airlines:21002',
            style: TextStyle(fontSize: 40,),),
          SizedBox(height: 20,),
          Text('wqe Airlines:11072',
            style: TextStyle(fontSize: 40,),),
          SizedBox(height: 20,),
          Text('sfdf Airlines:14002',
            style: TextStyle(fontSize: 40,),),
          SizedBox(height: 20,),
          Text('swq Airlines:11402',
            style: TextStyle(fontSize: 40,),),
          SizedBox(height: 20,),
          Text('ABC Airlines:11002',
            style: TextStyle(fontSize: 40,),),
          SizedBox(height: 20,),
          Text('ABC Airlines:11002',
            style: TextStyle(fontSize: 40,),),
          SizedBox(height: 20,),
          Text('ABC Airlines:11002',
            style: TextStyle(fontSize: 40,),),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

