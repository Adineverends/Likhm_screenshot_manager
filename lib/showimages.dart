
import 'dart:html';
import 'dart:ui';



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';


class image extends StatefulWidget {
  var value;
   image({Key? key, required this.value}) : super(key: key);

  @override
  _imageState createState() => _imageState();
}

class _imageState extends State<image> {



  bool uploading = false;
  double val = 0;
  CollectionReference imgRef;
  firebase_storage.Reference ref;

  List<File> _image = [];
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text(widget.value, style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 23),),
          backgroundColor: Colors.white,

          elevation: 0,
        ),

        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.yellow.shade600,
            onPressed: () {


            },
            child: Icon(Icons.add, size: 45,)
        ),

        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return index == 0
                  ? Center(
                child: IconButton(
                  icon: Image.asset('image/img.png', height: 50,),
                  onPressed: () {

                  },
                ),
              )
                  : Container();
            }


        )

    );
  }

  chooseImage() async {

  }

}