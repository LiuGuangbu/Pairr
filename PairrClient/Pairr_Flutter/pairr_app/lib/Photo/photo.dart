import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;

  Future getImage(ImageSource source, int type) async {
    var image = await ImagePicker.pickImage(source: source);
    setState(() {
      if (type == 0) {
        _image = image;
      } else {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
          child :GestureDetector(
                    child:new Container(
                      alignment: Alignment.center,
                     //color: Colors.red,
                      child: _image == null
                        ? Image.asset('images/pthoto.png',width: 250.0,height: 250.0,)
//                        ? Icon(Icons.photo_camera,
//                               color: Colors.blue,
//                                size: 250.0,
//                                )
                       : Image.file(_image,fit: BoxFit.cover,),
                    ),
                    onTap: (){
                      _showSelectionDialog(context,1);
                    },
                  ),
    );
  }

  void _showSelectionDialog(BuildContext context,int type) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (ctx) {
        return Container(
          color: Colors.grey,
          height: 200.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: _itemCreat(context, '拍照'),
                onTap: (){
                  print('选中拍照');
                  Navigator.pop(context);
                  getImage(ImageSource.camera,type);
                },
              ),
              GestureDetector(
                child: _itemCreat(context, '照片'),
                onTap: (){
                  print('选中照片');
                  Navigator.pop(context);
                  getImage(ImageSource.gallery,type);
                },
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: _itemCreat(context, '取消'),
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  Widget _itemCreat(BuildContext context, String title) {
    return Container(
      color: Colors.white,
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}


