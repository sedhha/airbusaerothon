import 'package:aero_next/allvalues.dart';
import 'package:aero_next/bookaflight.dart';
import 'package:aero_next/user.dart';
import 'package:flutter/material.dart';
class CompleteBookingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CompletebookingDetails();
  }
}
//https://intracash.in/airbus/user.php
class CompletebookingDetails extends StatefulWidget {
  @override
  _CompletebookingDetailsState createState() => _CompletebookingDetailsState();
}

class _CompletebookingDetailsState extends State<CompletebookingDetails> {
  @override
  void SendBookingConfirmation()
  {
    //TODO: Send booking confirmation using http
    url='http://intracash.in/airbus/book.php?t_id=$TravelID';
  }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Booking Successful",
            style: TextStyle(fontSize: 14),),
          content: Text(
            "Booking done! Congrats.",
            style: TextStyle(fontSize: 10,),),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Text("Go Back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight Details'),
        backgroundColor: Button_Color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 30,),
            Text(From),
            SizedBox(height: 30,),
            Text(To),
            SizedBox(height: 30,),
            Text(Date),
            SizedBox(height: 30,),
            Text(FlightName),
            SizedBox(height: 30,),
            Text(Scheduled_Arrival),
            SizedBox(height: 30,),
            Text(Scheduled_Departure),
            SizedBox(height: 30,),
            Text(Seats),
            SizedBox(height: 30,),
            Container(
              color: Colors.greenAccent,
              child: OutlineButton(
                color:Button_Color,
                borderSide: BorderSide(color:Colors.black,),
                shape: roundedrectangle,

                child: Center(child: Text('Register',
                  style: TextStyle(color: Colors.black,),)),
                onPressed: ()
                {
                  SendBookingConfirmation();
                  _showDialog();

                },
              ),
            ),
          ],
        ),
      )
    );
  }
}

