import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/Pages/BottonAppBar/PicturePage/photo_http.dart';
import 'package:login/Utils/Adapt.dart';
import 'package:login/scoped_models/main.dart';

class Picture extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _picture();
  }
}
class _picture extends State<Picture>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _openGallery();  //
  }
  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      global.set_photopath(image);
      print("图片路径：");
      print(global.get_photopath());
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Row(
            // mainAxisAlignment: ,
            children: <Widget>[
              new Expanded(
                child: new Container(

                  //alignment: Alignment.center,
                    child: Text(
                      '选中照片',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Adapt.px(35),
                        color: Theme.of(context).accentColor,
                      ),
                    )),
              ),
              global.get_photopath()!=null?
              RaisedButton(
                child: Text("下一步",style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder:(BuildContext content){
                        return photo_http();
                      }));//获取信息以及显示
                },
                shape: StadiumBorder(),
              ):null,
            ],
          ),
          //Text('选中照片',style: TextStyle(color: Theme.of(context).accentColor),),
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
//                  height: 600,
//                  width: 600,
            color: Theme.of(context).primaryColor,
            child: ListView(
              children: <Widget>[
                _ImageView(global.get_photopath()),
                global.get_photopath()!=null?
                RaisedButton(
                  child: Text("下一步",style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder:(BuildContext content){
                          return photo_http();
                        }));//获取信息以及显示
                  },
                  shape: StadiumBorder(),
                ):Text("请选择照片"),//后期改成警示框
              ],
            ),
          )
      ),
    );
  }
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("请选择图片或拍照"),
      );
    } else {
      return Image.file(
        imgPath,
      );
    }
  }
}
