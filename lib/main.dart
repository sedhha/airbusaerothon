import 'package:aero_next/firebase_ml_kit.dart';
import 'package:aero_next/flutter_barcode.dart';
import 'package:aero_next/welcome_screen.dart';
import 'package:flutter/material.dart';
void main() => runApp(SpecialApp());
class SpecialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

