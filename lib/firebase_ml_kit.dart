import 'dart:io';
import 'dart:convert';
import 'package:aero_next/allvalues.dart';
import 'package:aero_next/login.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:path/path.dart';
class Display_Image extends StatefulWidget {
  @override
  _Display_ImageState createState() => _Display_ImageState();
}

class _Display_ImageState extends State<Display_Image> {
  File _image;
  String Analysis="0";
  String phpEndPoint='http://c955ab86.ngrok.io/results';
  String url1;
  bool ShowSpinner=false;
  Future UploadPic(BuildContext context)
  async
  {
    try
    {String filename=_image!=null?basename(_image.path):'Empty path';
    StorageReference fireBaseStorageRef=FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask uploadTask=fireBaseStorageRef.putFile(_image);
    print('upload task:$uploadTask');
    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String Imagename=basename(_image.path);
    print('ImageName=$Imagename');
    url1 = dowurl.toString();
    //print(url1);
    //print(fireBaseStorageRef);
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"email": "$EmailID", "url": "$url1", "AN": "$Analysis", "name":"$Imagename"}';
    print(json);
    setState(() {
      ShowSpinner=true;
    });
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    setState(() {
      print('Picture upload successful.');
      ShowSpinner=false;
      //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Upload successful!'),));
    });
    http.Response response = await http.put(phpEndPoint, headers: headers, body: json);
    int statusCode = response.statusCode;
    print(jsonDecode(response.body));
    print('x');
    if(statusCode==200)
    print('Wow');}
    catch(e)
    {
      print(e);
    }
  }
  void ImageGrab(int i)
  async {
    setState(() {
      ShowSpinner=true;
    });
    try
    {
      if(i==1) {
        File gallerfile = await ImagePicker.pickImage(
            source: ImageSource.gallery);
        _image=gallerfile;
        setState(() {
          ShowSpinner=false;
        });
      }
      else {
        File gallerfile = await ImagePicker.pickImage(
            source: ImageSource.camera);
        _image=gallerfile;

      setState(() {
        ShowSpinner=false;
      });}
      //print('Selected image path: ${gallerfile.path}');

    }
    catch(e)
    {
      print(e);
    }

  }
  void _upload()
  async{
    if (_image == null) return;
    String base64Image = base64Encode(_image.readAsBytesSync());
    print('Base64 image$base64Image');
    String fileName = _image.path.split("/").last;

    var response= await http.post(phpEndPoint, body: {
      'image': base64Image,
      'name': fileName,
    });
    print(response.statusCode);
    print(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background_Color,
      appBar: AppBar(
        title: Text('Upload Soil Image to Server'),
        backgroundColor: Button_Color,
      ),
      //backgroundColor: Colors.deepPurpleAccent,
      body: ModalProgressHUD(
        inAsyncCall: ShowSpinner,
        child: Column(
          children: <Widget>[
            //SizedBox(height: 10,),
            Container(
              color: Color(0xFF1CEF5B),
              height: 50,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  FlatButton(
                    child: Icon(Icons.camera),
                    onPressed: (){
                      ImageGrab(0);
                    },
                  ),
                  SizedBox(width: 30,),
                  FlatButton(
                    child: Icon(Icons.file_upload),
                    onPressed: (){
                      //_upload();
                      //_makePostRequest();
                      UploadPic(context);
                    },
                  ),
                  SizedBox(width: 30,),
                  FlatButton(
                    child: Icon(Icons.image),
                    onPressed: (){
                      ImageGrab(1);
                    },
                  ),
                  SizedBox(width: 10,)
                ],
              ),
            ),
            //SizedBox(height: 10,),
            Expanded(
              child:Container(
                width: double.infinity,
                child: _image==null?Text('Image Appears here'):Image.file(_image),
                color: Background_Color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
