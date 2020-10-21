import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login/Pages/BottonAppBar/PicturePage/camera_load.dart';

import 'package:login/Pages/BottonAppBar/Write_more_Page/noteShow.dart';

import 'package:login/Pages/BottonAppBar/Write_more_Page/notes_picture_load.dart';
import 'package:login/Utils/Adapt.dart';
import 'package:login/scoped_models/main.dart';
import 'package:login/scoped_models/notes.dart';
import 'package:login/scoped_models/notes.dart' as prefix0;
import 'package:shared_preferences/shared_preferences.dart';

class NewsWritting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsWrittingState();
  }
}

class NewsWrittingState extends State<NewsWritting> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String title;
  String content;


  var part =null;
  List<String> _listNotes;
  DateTime now = new DateTime.now();
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  _modelBottomSheet() async{
    var result=await showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
              height: 220,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text("相机",textAlign: TextAlign.center),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context){
                            return Camera();
                          }
                      ));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text("相册",textAlign: TextAlign.center),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context){
                            return Picture();
                          }
                      ));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text("取消",textAlign: TextAlign.center),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Divider(),

                ],
              )
          );
        });
    print(result);
  }
  _save( ) async{
    now = new DateTime.now();
    title = titleController.text;
    content =contentController.text;
    Notes.setTitle(title);
    Notes.setNowtime(now);
    Notes.setContent(content);
  //  Notes.setNotes(_listNotes);
//    var Notesdata ={
//      'title':title,
//      'content':content,
//      'part':part,
//    };
//    _listNotes.add(title);
//    _listNotes.add(content);
//    _listNotes.add(part);

  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
            leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back_ios,
                size: Adapt.px(35),
                color: Theme.of(context).accentColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          title: Container(
            alignment: Alignment.center,
            child: Text(
              '创建随记',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Adapt.px(35),
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
            actions: <Widget>[
              RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text(
                    "保存",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if(content==null)

                        _save();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>NoteShow(title,content)));

                    });

                  },
                //  shape: StadiumBorder(),
                ),
            ]
           ),
        preferredSize: Size.fromHeight(Adapt.px(90)),
      ),
      body: Container(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              TextField(
                cursorColor: Theme.of(context).primaryColorLight,
              //  textInputAction: TextInputAction.go,
                controller: titleController,
                // keyboardType: TextInputType.number,
                decoration: InputDecoration(
                //  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10.0),
                  //  icon: Icon(Icons.text_fields),
                  labelText: '标题',
                  //helperText: '请输入...',
                ),
                autofocus: false,
              ),
              TextField(
                controller: contentController,
                cursorColor: Theme.of(context).primaryColorLight,
                // keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  //  icon: Icon(Icons.text_fields),
                  labelText: '请输入正文（必填）',
                  helperText: '使用中文逗号，展示时可以自动换行哦',
                ),
                autofocus: false,
              ),
              Column(
                children: <Widget>[
                  _ImageView(global.get_photopath()),
                  global.get_photopath()!=null?
                  RaisedButton(
                    child: Text("更换图片",style: TextStyle(color: Colors.white),),
                    onPressed: _modelBottomSheet,
                    shape: StadiumBorder(),
                  ):RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      "添加背景图片",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: _modelBottomSheet,
                    // shape: StadiumBorder(),
                  ),//后期改成警示框
                ],
              ),

            ],
          )),
    );
  }
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("请选择图片或拍照"),
      );
    } else {
      return Container(
        width: 100,
        height: 100,
        child: Image.file(
          imgPath,
        ),
      )
        ;
    }
  }
}




