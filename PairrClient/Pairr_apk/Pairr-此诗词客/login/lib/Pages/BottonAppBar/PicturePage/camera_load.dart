import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Pages/BottonAppBar/PicturePage/camera_http.dart';
import 'package:login/Utils/Adapt.dart';
import 'package:login/scoped_models/main.dart';

class Camera extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _camera();
  }
}
class _camera extends State<Camera>{
  String data;
  String info="请稍后";
  String  imageBase;
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    _takePhoto();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._takePhoto();
  }


  /*拍照*/
  _takePhoto() async {
    var _image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      global.set_photopath(_image);
      print("图片路径：");
      print(global.get_photopath());
    });
    print(_image);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (global.get_photopath() == null)?null:Scaffold(
        appBar: PreferredSize(
          child:  AppBar(
            title: ListTile(
              title:  Text('选中照片',textAlign: TextAlign.center,style: TextStyle(color: Theme.of(context).accentColor),),
              trailing:
              (global.get_photopath()!=null)?
              RaisedButton(
                child: Text("下一步",style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder:(BuildContext content){
                        return camera_http();
                      }));//获取信息以及显示
                },
                shape: StadiumBorder(),
              ):Text('',style: TextStyle(fontSize: 0),),
            ),
            leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back_ios,
                size: Adapt.px(35),
                color: Theme.of(context).accentColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          preferredSize: Size.fromHeight(Adapt.px(90)),
        ),
        body: Center(
            child:Container(
              padding: EdgeInsets.all(Adapt.px(40.0)),
              color: Theme.of(context).primaryColor,
              child: ListView(
                children: <Widget>[
                  _ImageView(global.get_photopath()),
                  (global.get_photopath()!=null)?
                  RaisedButton(
                    child: Text("下一步",style: TextStyle(color: Colors.white),),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder:(BuildContext content){
                            return camera_http();
                          }));//获取信息以及显示
                    },
                    shape: StadiumBorder(),
                  ):Text("请选择照片"),
                ],
              ),
            )
        )
    );
  }

  /*图片控件*/
  Widget _ImageView(imgPath) {
    return (global.get_photopath() == null)?
    Center(
        child: Text("请选择图片或拍照")
    ) :
    Image.file(
      imgPath,
    );
  }
}
//图片转换
class EncodeUtil {
  /*
  * 通过图片路径将图片转换成Base64字符串
  */
  static Future image2Base64(String path) async {
    File file = new File(path);
    List<int> imageBytes = await file.readAsBytes();
    print(imageBytes.length);
    print(imageBytes);
    return base64Encode(imageBytes);
  }
}

