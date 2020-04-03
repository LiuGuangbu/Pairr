import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../HomePage/home_page.dart';
import '../SearchPage/searchMain.dart';
import 'mineMain.dart';

class UserSetting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Tabs();
  }

}
class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key, this.index = 1}) : super(key: key);
  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  _TabsState(index) {
    this._currentIndex = index;
  }
  List _pageList = [home_Page(), SearchBarDemoPage(), MinePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: this._pageList[this._currentIndex],
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // Expanded(
                //   child: DrawerHeader(
                //     child: Text('你好Flutter'),
                //     decoration: BoxDecoration(
                //       // color: Colors.yellow
                //       image: DecorationImage(
                //         image: NetworkImage('https://www.itying.com/images/flutter/2.png'),
                //         fit:BoxFit.cover
                //       ),
                //     ),
                //   )
                // )

                Expanded(
                  child: UserAccountsDrawerHeader(
                    accountName: Text('老师你好'),
                    accountEmail: Text('gztt@163.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.itying.com/images/flutter/3.png'),
                    ),
                    decoration: BoxDecoration(
                      // color: Colors.yellow
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://www.itying.com/images/flutter/2.png'),
                          fit: BoxFit.cover),
                    ),
                    otherAccountsPictures: <Widget>[
                      Image.network(
                          'https://www.itying.com/images/flutter/5.png'),
                      Image.network(
                          'https://www.itying.com/images/flutter/4.png')
                    ],
                  ),
                )
              ],
            ),
            ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.home),
                ),
                title: Text('我的空间')),
            Divider(),
            ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.home),
                ),
                title: Text('用户中心'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/user');
                }
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text('用户中心'),
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Text('右侧侧边栏'),
      ),
    );
  }
}
//
//class UserSetting extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(title: Text('个人信息'),),
//      body: new ListView(
//        children: <Widget>[
//          new Container(
//              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//              child: Opacity(opacity: 0.1,
//                child: Container(
//                  decoration: new BoxDecoration(color: Colors.grey),
//                  height: 15.0,
//                ),)
//
//          ),
//          new Container(
//            alignment: Alignment.center,
//            padding: EdgeInsets.all(30.0),
//            child: Image.asset('lib/images/cat.jpg',width: 150,height: 150,
//
//            ),
//
//          ),
//          new Container(
//              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//              child: Opacity(opacity: 0.1,
//                child: Container(
//                  decoration: new BoxDecoration(color: Colors.grey),
//                  height: 10.0,
//                ),)
//
//          ),
//
//          ListTile(
//            title: Text('我的收藏'),
//            //   leading: Icon(Icons.build),
//            trailing: Icon(Icons.arrow_forward_ios),
//            onTap: () {
//              //跳出提示框
////              showDialog(
////                  context: context,
////                  child: new SimpleDialog(
////                    contentPadding: const EdgeInsets.all(10.0),
////                    title: new Text("我是标题"),
////                    children: <Widget>[new Text("我是内容区域")],
////                  ));
//            },
//          ),
//          new Container(
//              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//              child: Opacity(opacity: 0.1,
//                child: Container(
//                  decoration: new BoxDecoration(color: Colors.grey),
//                  height: 2.0,
//                ),)
//
//          ),
//        ],
//      ),
//    );
//  }
//
//}