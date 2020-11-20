import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:doap/Shared/constants.dart';
import 'dart:io';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    File _image;
    final picker = ImagePicker();
    /*
    Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } 
      else {
        print('No image selected.');
      }
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
    */
    
    return Scaffold(
        appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        //width: 100,
        //height: 100,
        //decoration: BoxDecoration(
        //shape: BoxShape.circle,
        //color: Colors.orange,
        //),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column (
            children: <Widget>[
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Nome'),
              validator: null,
              onChanged: null,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Username'),
              validator: null,
              onChanged: null,
            ),
            ],
          ),
        ),
      ),
    );
    
  }
}