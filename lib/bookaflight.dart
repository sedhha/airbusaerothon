import 'dart:convert';

import 'package:aero_next/allvalues.dart';
import 'package:aero_next/completebookingdetails.dart';
import 'package:aero_next/user.dart';
import 'package:flutter/material.dart';
import 'flightdetailsscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class BookAFlight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookaFlight();
  }
}
class BookaFlight extends StatefulWidget {
  @override
  _BookaFlightState createState() => _BookaFlightState();
}
Future MyAllFlightDetails;
String url='https://intracash.in/airbus/user.php';
String From;
String To;
String Date;
String FlightID;
String TravelID;
String FlightName;
String Seats;
String Scheduled_Arrival;
String Scheduled_Departure;

class _BookaFlightState extends State<BookaFlight> {

  @override
  Future getJsonData()
  async {
    //TODO: Input flight data
    url='http://intracash.in/airbus/query_flights.php?source=$From&destination=$To&date=$Date&parm=1';
    print(url);
    var response = await http.post(url, body: {});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    FlightID=jsonDecode(response.body)[0]['Flight_id'];
    TravelID=jsonDecode(response.body)[0]['travel_id'];
    FlightName=jsonDecode(response.body)[0]['flight_name'];
    Seats=jsonDecode(response.body)[0]['Seats'];
    Scheduled_Departure=jsonDecode(response.body)[0]['Scheduled_departure'];
    Scheduled_Arrival=jsonDecode(response.body)[0]['Scheduled_arrival'];
    print(FlightName);
    print(FlightID);
    print(Seats);
    print(Scheduled_Departure);
    print(Scheduled_Arrival);
    print(TravelID);

    //print(jk);

    return(MyAllFlightDetails);

  }
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Background_Color,
      appBar: AppBar(title: Text('Search For the Flight'),
        backgroundColor: Button_Color,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),

          Container(
            color: Colors.white,
            child: TextFormField(
              obscureText: false,
              style: LoginTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    left: 20, bottom: 20, top: 20, right: 20),
                hintText: 'From',hintStyle: LoginTextStyle.copyWith(
                color: Colors.black38,
              ),),
              cursorColor: Colors.black,
              onChanged: (text) {From = text;},

            ),
          ),
          SizedBox(height: 20,),
          Container(
              color:Colors.white,
              child: SizedBox(height: 20,)),
          SizedBox(height: 20,),
          Container(
            color: Colors.white,
            child: TextFormField(
              obscureText: false,
              style: LoginTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    left: 20, bottom: 20, top: 20, right: 20),
                hintText: 'To',hintStyle: LoginTextStyle.copyWith(
                color: Colors.black38,
              ),),
              cursorColor: Colors.black,
              onChanged: (text) {To = text;},

            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            obscureText: false,
            style: LoginTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  left: 20, bottom: 20, top: 20, right: 20),
              hintText: 'Date(yyyy-mm-dd)',hintStyle: LoginTextStyle.copyWith(
              color: Colors.black38,
            ),),
            cursorColor: Colors.black,
            onChanged: (text) {Date = text;},

          ),
          Container(width: 250,height:50,
            child: DecoratedBox(
              decoration:
              ShapeDecoration(shape:roundedrectangle, color:Button_Color),
              child: OutlineButton(
                color:Button_Color,
                borderSide: BorderSide(color:Colors.white,),
                shape: roundedrectangle,

                child: Center(child: Text('Search Flights',
                  style: TextStyle(color: Colors.white,),)),
                onPressed: ()
                {
                  MyAllFlightDetails=getJsonData();
                  //print(MyAllFlightDetails);
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>CompleteBookingDetails()),);
                }
              ),
            ),),
        ],
      ),

    );
  }
}

