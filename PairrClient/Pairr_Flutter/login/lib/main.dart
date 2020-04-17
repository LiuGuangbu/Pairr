
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/scoped_models/Adapt.dart';
import 'package:login/scoped_models/ConfigProvide.dart';
import 'package:login/scoped_models/ConfigProvide.dart' as prefix0;
import 'package:login/scoped_models/theme.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:login/Pages/BottonAppBar/PhotoPage/photoMain.dart';
import 'package:login/Pages/BottonAppBar/SearchPage/searchMain.dart';
import 'package:login/Pages/BottonAppBar/UserPage/mineMain.dart';
import 'package:login/Pages/BottonAppBar/Write_more_Page/newsMain.dart';
import 'package:login/Pages/BottonAppBar/HomePage/home_page.dart';
import 'package:login/scoped_models/main.dart';

void main() async {
  runApp(ProviderNode(child: MyApp(), providers: providers));  //将状态放入顶层
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Provide.value<ConfigProvide>(context).$getTheme();  //修改当前主题
    final MainModel _model = MainModel();//用户全局变量控制
    return Provide<ConfigProvide>(// 使用主题
      builder: (context,child,configProvide){
        return ScopedModel<MainModel>(
           model: _model,
           child: MaterialApp(
             debugShowCheckedModeBanner: false,  //调试显示检查模式横幅
           //  onGenerateRoute: Routes.router.generator, //生成路由
             theme: AppTheme.getThemeData(configProvide.theme),
                home: MyHomePage(),

    ),
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
  Widget build(BuildContext context) {
    //ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model){
          return WillPopScope(
        child: Scaffold(
          body: PageView(
            children: <Widget>[home_Page(),SearchBarDemoPage(), NewsPage(), MinePage()],
            onPageChanged: onPageChanged,
            controller: pageController,
          ),
          floatingActionButton: Container(
            height: Adapt.px(80),
            width: Adapt.px(80),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor ,
              onPressed: () {
                showDialog(
                    barrierDismissible: true,//是否点击空白区域关闭对话框,默认为true，可以关闭
                    context: context,
                    builder: (BuildContext context) {
                      var list = List();
                      list.add('相册');
                      list.add('相机');
                      //list.add('保存图片');
                      return CommonBottomSheet(
                        list: list,
                        onItemClickListener: (index) async {
                          Navigator.pop(context);
                        },
                      );
                    });

              },
              //mini: false,
              child: Icon(
                Icons.photo_camera,
                size: Adapt.px(45),
                color: Theme.of(context).accentColor,


              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color:Theme.of(context).primaryColor,
            shape: CircularNotchedRectangle(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
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
                          Text("推荐", style: TextStyle(color: getColor(0),fontSize:Adapt.px(30),fontFamily: this.text_Family,))
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
                          Text("搜索", style: TextStyle(color: getColor(1),fontSize:Adapt.px(30),fontFamily: this.text_Family,))
                        ],
                      )),
                  Column(
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
                          Text("随记", style: TextStyle(color: getColor(2),fontSize:Adapt.px(30),fontFamily: this.text_Family,))
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
            ),
          ),
        ),
//        onWillPop: () {
//          int newTime = DateTime.now().millisecondsSinceEpoch;
//          int result = newTime - lastTime;
//          lastTime = newTime;
//          if (result > 2000) {
//          // Toast.show(context, '再按一次退出');
//          } else {
//            SystemNavigator.pop();
//          }
//          return null;
//        }
        );
        }
    );


  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: this.page);
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
}



