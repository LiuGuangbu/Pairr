
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_guidance_plugin/flutter_guidance_plugin.dart';
import 'package:login/Utils/Adapt.dart';
import 'package:login/Utils/ConfigProvide.dart';
import 'package:login/Utils/theme.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:login/Pages/BottonAppBar/SearchPage/searchMain.dart';
import 'package:login/Pages/BottonAppBar/UserPage/mineMain.dart';
import 'package:login/Pages/BottonAppBar/Write_more_Page/newsMain.dart';
import 'package:login/Pages/BottonAppBar/HomePage/home_page.dart';
import 'package:login/scoped_models/main.dart';
import 'Pages/BottonAppBar/PicturePage/camera_load.dart';
import 'Pages/BottonAppBar/PicturePage/picture_load.dart';

void main() async {
  runApp(ProviderNode(child: MyApp(), providers: providers));  //将状态放入顶层
}
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }

}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Provide.value<ConfigProvide>(context).$getTheme();  //修改当前主题
    return Provide<ConfigProvide>(// 使用主题
      builder: (context,child,configProvide){
        return MaterialApp(
            debugShowCheckedModeBanner: false,  //调试显示检查模式横幅
            //  onGenerateRoute: Routes.router.generator, //生成路由
            theme: AppTheme.getThemeData(configProvide.theme),
            home: MyHomePage(),
        );
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {


  int lastTime = 0;
  PageController pageController;
  int page = 0;
  var text_Family = 'ShouJinting';

  //double text_Size = 20.0;
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather();
    pageController = PageController(initialPage: this.page);

  }
  String CityName="";
  String weather="";
  String win="";
  String infomation;
  void getWeather (){
    http.get('https://tianqiapi.com/api?version=v6&appid=36728434&appsecret=ZiqL5VBH').then((http.Response response){
      var jsonData =json.decode(response.body);
      print(jsonData);
      CityName=jsonData["city"];
      print(CityName);
      weather=jsonData["wea"];
      print(weather);
      win=jsonData["win"];
      print(win);
    });
  }
  @override
  Widget build(BuildContext context) {
    //ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return WillPopScope(

      onWillPop: () async => showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: new Text(
              '您确定要退出吗？',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: Adapt.px(28)),
            ),
            actions: [
              CupertinoDialogAction(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
              CupertinoDialogAction(
                child: Text('确认'),
               onPressed: () => Navigator.of(context).pop(true),
              ),

            ],
          );
        },
      ),
            child: Scaffold(
              body:
              PageView(
                children: <Widget>[home_Page(),SearchBarDemoPage(), NewsPage(), MinePage()],
                onPageChanged: onPageChanged,
                controller: pageController,
              ),
              floatingActionButton: (global.get_Fbutton())?Container(
                height: Adapt.px(110),
                width: Adapt.px(110),
                child: FloatingActionButton(
                  //  key: _key4,
                  child: Icon(
                    Icons.photo_camera,
                    size: Adapt.px(60),
                    color: Theme.of(context).accentColor,
                  ),
                  backgroundColor: Theme.of(context).primaryColor ,
                  onPressed:_modelBottomSheet,
                  //mini: false,
                ),
              ):null,
              floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                color:Theme.of(context).primaryColor,
                shape: CircularNotchedRectangle(),
                child:Stack(children: <Widget>[Padding(
                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            onTap(0);
                          },
                          child: Column(

                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.calendar_today, color: getColor(0),size:Adapt.px(45),),
                              Text("推荐", key: _key1,style: TextStyle(color: getColor(0),fontSize:Adapt.px(30),fontFamily: this.text_Family,))
                            ],
                          )),
                      GestureDetector(
                          onTap: () {
                            onTap(1);

                            //showSearch(context: context, delegate: SearchBarDemoPage());
                          },
                          child: Column(

                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.search, color: getColor(1),size: Adapt.px(45),),
                              Text("搜索",   key: _key2,style: TextStyle(color: getColor(1),fontSize:Adapt.px(30),fontFamily: this.text_Family,))
                            ],
                          )),
                      Column(
                        key: _key4,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: Colors.transparent,
                          ),
                          //Text("拍照", style: TextStyle(color: Color(0xFFEEEEEE)))
                        ],
                      ),
                      GestureDetector(
                          onTap: () {
                            onTap(2);
                          },
                          child: Column(

                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[

                              Icon(Icons.mail, color: getColor(2),size: Adapt.px(45),),
                              Text("随记", key: _key3, style: TextStyle(color: getColor(2),fontSize:Adapt.px(30),fontFamily: this.text_Family,))
                            ],
                          )),
                      GestureDetector(
                          onTap: () {
                            onTap(3);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.person, color: getColor(3),size: Adapt.px(45),),
                              Text("我的", style: TextStyle(color: getColor(3),fontSize:Adapt.px(30),fontFamily: this.text_Family,))
                            ],
                          ))
                    ],
                  ),
                ),],),

              ),
            ),

          );




  }




  void onPageChanged(int value) {
    setState(() {
      this.page = value;
    });
  }

  Color getColor(int value) {
    return this.page == value
        ? Theme.of(context).primaryColorLight
        : Theme.of(context).accentColor;
  }


  void onTap(int value) {
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 100), curve: Curves.ease);
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
  GlobalKey _key1 = GlobalKey();
  GlobalKey _key2 = GlobalKey();
  GlobalKey _key3 = GlobalKey();
  GlobalKey _key4 = GlobalKey();

}



