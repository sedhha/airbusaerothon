import 'package:flutter/material.dart';
ThemeData theme= ThemeData(
// Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.lightBlue[800],
  accentColor: Colors.cyan[600],

// Define the default font family.
  fontFamily: 'Montserrat',

// Define the default TextTheme. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);
Color Background_Color=Color(0xFF4B1248);
Color Button_Color=Color(0xFF1D0B38);
RoundedRectangleBorder roundedrectangle=RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0));
TextStyle LoginScreenTextStyle=TextStyle(
    fontFamily: 'Montserrat',fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal);
TextStyle LoginTextStyle=TextStyle(
    fontFamily: 'Montserrat',fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,color: Colors.black);
double IconFontSize=12;
double iconpixels=12;
List<IconData> iconvalues=[Icons.radio_button_checked,
  Icons.radio_button_unchecked,Icons.radio_button_unchecked];
int iconvalued=0;
IconData iconinactive=Icons.radio_button_unchecked;
IconData iconactive=Icons.radio_button_checked;
List<String> MessageDisplayList=[
  "You have entered invalid PNR. It's not associated with any booking, Kindly recheck and go back to the previous page to enter PNR again.",
  "Please go back and do the online luggage check-in first.",
  "You have completed your luggage Check In, you may now drop your bag at security point and directly go for security check-in."

];
double luggagescreenkvalues=100;
double chotecomponentskvalues=20;

