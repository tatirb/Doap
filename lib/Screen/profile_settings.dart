import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:doap/Shared/constants.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    File _image;
    final picker = ImagePicker();
    
    Future getImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print('Image Path $_image');
      } else {
        print('No image selected.');
      }
    });
    }
    Future uploadPic() async {
      String filename = p.basename(_image.path);
      Reference storageReference = FirebaseStorage.instance.ref().child(filename);
      UploadTask uploadTask = storageReference.putFile(_image);
      TaskSnapshot taskSnapshot = await uploadTask;
      if (_image != null) {
        print('hey');
        var downloadUrl = await taskSnapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
      }
      else {
        print('Try again :(');
      }
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
                      Container(
            width: double.infinity,
            padding: EdgeInsets.all(17),
            child: Center(
              child: Stack(
                 alignment: Alignment.bottomRight,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                  ),
                  Container(
                    child: IconButton(
                      alignment: Alignment.bottomRight,
                      icon: Icon(Icons.add_a_photo),
                      color: Colors.grey,
                      onPressed: getImage,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
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
                    SizedBox(height: 20.0),
                      RaisedButton(
                        color: Colors.pink,
                        child: Text(
                        'DONE',
                        style: TextStyle(color: Colors.white),
                        ),
                        onPressed: null,
                      ),
                  ],
                ),
              ),
           ),
           Container (
                child: RaisedButton(
                        color: Colors.pink,
                        child: Text(
                        'DONE',
                        style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async  { 
                          uploadPic();
                        }
                      ),
           ),
          ],
        ),
      ),
    );
  }
}