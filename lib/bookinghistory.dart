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
        children: CompleteBookingWidgetTree,
      ),
    );
  }
}

