import 'package:aero_next/allvalues.dart';
import 'package:flutter/material.dart';

class CropRequirement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CropsRequirement();
  }
}

class CropsRequirement extends StatefulWidget {
  @override
  _CropsRequirementState createState() => _CropsRequirementState();
}

class _CropsRequirementState extends State<CropsRequirement> {
  static List<String> DisplayValue=['Select','State on Demand','Crop on Demand'];
  String Dispvalue='Select';
  int states=0;
  String valueA='';
  String Crop='Select Crop';
  String Major_Crop='';
  String State='';
  var _states=['Kerala','Karnatka','Tamil Nadu','Andhra Pradesh'];
  var _crops=['Jowari','Bajra','Rice','Wheat','Gram','Maize','Sugarcane'];
  var _currentvalue='Select State';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse Cities'),
        backgroundColor: Button_Color,
      ),
      backgroundColor: Background_Color,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          Center(
            child: DropdownButton<String>(
              hint: Text(_currentvalue,
              style: TextStyle(
                color: Colors.white,
              ),),
              items: _states.map((String DropdownStringItem){
                return(DropdownMenuItem<String>(value: DropdownStringItem,
                  child:Text(DropdownStringItem),));
              }).toList(),
              onChanged: (value)
              {

                setState(() {
                  this._currentvalue=value;
                });
              },
              //value: _currentvalue,
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: DropdownButton<String>(
              hint: Text(Crop,
              style: TextStyle(color: Colors.white),),
              items: _crops.map((String DropdownStringItem){
                return(DropdownMenuItem<String>(value: DropdownStringItem,
                  child:Text(DropdownStringItem),));
              }).toList(),
              onChanged: (value)
              {

                setState(() {
                  Crop=value;
                });
              },
            ),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DecoratedBox(
                decoration:
                ShapeDecoration(shape:roundedrectangle, color:Button_Color),
                child: OutlineButton(
                  color:Button_Color,
                  borderSide: BorderSide(color:Colors.white,),
                  shape: roundedrectangle,

                  child: Center(
                      child: Text(
                        'State Prediction',style: TextStyle(
                          color: Colors.white),)),
                  onPressed: ()
                  {
                    setState(() {
                      Dispvalue=DisplayValue[1];
                      State=_states[1];
                    });
                    //Navigator.push(context,
                      //MaterialPageRoute(builder: (context)=>LoginScreen()),);
                  },
                ),
              ),
              DecoratedBox(
                decoration:
                ShapeDecoration(shape:roundedrectangle, color:Button_Color),
                child: OutlineButton(
                  color:Button_Color,
                  borderSide: BorderSide(color:Colors.white,),
                  shape: roundedrectangle,

                  child: Center(
                      child: Text(
                        'Crop Wise',style: TextStyle(
                          color: Colors.white),)),
                  onPressed: ()
                  {
                    setState(() {
                      Dispvalue=DisplayValue[2];
                      State=_crops[2];

                    });
                    //Navigator.push(context,
                      //MaterialPageRoute(builder: (context)=>LoginScreen()),);
                  },
                ),
              ),

            ],
          ),
          SizedBox(height: 20,),
          Container(
            height: 250,width: double.infinity,
            color: Color(0xFF03C04A),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50,),
                Text(
                  Dispvalue,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  '$State',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),

        ],
      ),
      );

  }
}

