import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  File _image2;

  Future getImage(ImageSource source, int type) async {
    var image = await ImagePicker.pickImage(source: source);
    setState(() {
      if (type == 0) {
        _image = image;
      } else {
        _image2 = image;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('aaaa'),
      ),
      body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: _image == null
                          ? Text('No image selected.')
                          : Image.file(_image,fit: BoxFit.cover,),
                    ),
                    onTap: () {
                      //点击选取图片
                      // getImage(0);
                      _showSelectionDialog(context,0);
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.orange,
                      child: _image2 == null
                          ? Text('No image selected.')
                          : Image.file(_image2,fit: BoxFit.cover),
                    ),
                    onTap: () {
                      _showSelectionDialog(context,1);
                      // getImage(1);

                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }

  void _showSelectionDialog(BuildContext context,int type) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (ctx) {
        return Container(
          color: Colors.grey,
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: _itemCreat(context, '相机'),
                onTap: (){
                  print('选中相机');
                  Navigator.pop(context);
                  getImage(ImageSource.camera,type);
                },
              ),
              GestureDetector(
                child: _itemCreat(context, '相册'),
                onTap: (){
                  print('选中相册');
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
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}


