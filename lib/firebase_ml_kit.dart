import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:path/path.dart';
class Display_Image extends StatefulWidget {
  @override
  _Display_ImageState createState() => _Display_ImageState();
}

class _Display_ImageState extends State<Display_Image> {
  File _image;
  bool ShowSpinner=false;
  Future UploadPic(BuildContext context)
  async
  {
    try
    {String filename=_image!=null?basename(_image.path):'Empty path';
    StorageReference fireBaseStorageRef=FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask uploadTask=fireBaseStorageRef.putFile(_image);
    setState(() {
      ShowSpinner=true;
    });
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    setState(() {
      print('Picture upload successful.');
      ShowSpinner=false;
      //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Upload successful!'),));
    });}
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Test'),
      ),
      //backgroundColor: Colors.deepPurpleAccent,
      body: ModalProgressHUD(
        inAsyncCall: ShowSpinner,
        child: Column(
          children: <Widget>[
            //SizedBox(height: 10,),
            Container(
              color: Colors.deepPurpleAccent,
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
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
