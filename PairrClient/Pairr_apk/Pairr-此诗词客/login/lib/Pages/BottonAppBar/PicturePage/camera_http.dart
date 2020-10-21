import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:login/Pages/BottonAppBar/PicturePage/Show_Picture_and_Poem.dart';
import 'package:login/Utils/Adapt.dart';
import 'package:login/scoped_models/main.dart';

class camera_http extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Camera_http();
  }
}

class Camera_http extends State<camera_http> {
  List _list = [];
  File path;
  String imageBase;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._uploadImage();
  }

  _uploadImage() async {
    path = global.get_photopath();
    print("文件路径$path");
    var name = path.toString().substring(
        path.toString().lastIndexOf("/") + 1, path.toString().length - 1);
    String pathname = path.toString().substring(8, path.toString().length - 1);
    print(name);
    print(pathname);
    global.set_imagepath2(pathname);
    print('上传服务器的图片路径$path');
    //照片传输（转换为字节码文件）
    imageBase = await EncodeUtil.image2Base64(pathname);
    global.setimageBase(imageBase);
    print(imageBase.length);
    print("""转换之后的数据$imageBase""");
    //发送post请求
    var apiUrl = global.get_apiUrlphoto(); //apiUrl="http://192.168.1.9:5050/photo";
    var response = await http.post(apiUrl, body: {'photo_search': imageBase});
    if (response.statusCode == 200) {
      print("得到数据库数据");
      setState(() {
        this._list = convert.jsonDecode(response.body)['photo_search'];
        print('得到数据是：${this._list}');
        global.setlistPoemslength(this._list.length);
        global.setlistPoems(this._list);
      });
      // print("输出得到的数据$_list");
    } else {
      print('失败: ${response.statusCode}');
    }
    print('请求结束！！！');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PoemChange(_list);
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



class PoemChange extends StatelessWidget {
  final List _list;
  PoemChange(this._list);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _list.length > 0
        ? Show_Picture_and_Poem(_list)
        : Scaffold(
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
        ),
        preferredSize: Size.fromHeight(Adapt.px(90)),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(
              strokeWidth: 4.0,
              backgroundColor:
              Theme.of(context).dividerColor, // value: 0.2,
              valueColor: new AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColorLight,
              ),
            ),
            Text("加载中...",
                style: TextStyle(
                  fontSize: Adapt.px(25),
                  color: Theme.of(context).accentColor,
                )),
          ],
        ),
      ),
    );
  }
}
