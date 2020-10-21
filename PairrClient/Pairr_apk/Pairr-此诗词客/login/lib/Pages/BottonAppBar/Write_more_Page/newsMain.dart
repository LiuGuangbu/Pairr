import 'package:flutter/material.dart';

import 'package:login/Pages/BottonAppBar/Write_more_Page/noteShow.dart';
import 'package:login/Utils/Adapt.dart';
import 'package:login/scoped_models/main.dart';
import 'package:login/scoped_models/notes.dart';

import 'news_writting.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsPageState();
  }
}

class NewsPageState extends State<NewsPage> {
  var imgUrl = 'lib/images/login4jpg';
  var newsName = "全部随记";
  int _NotesLength = 0;
  List _listNotes;

  String title;
  String content;

  _showTitle() async {
    title = Notes.getTitle();
    content = Notes.getContent();
    if (Notes.getTitle() != null) _NotesLength = 1;
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    _showTitle();
  }

  @override
  Widget build(BuildContext context) {
    _showTitle();
    return new Scaffold(
        appBar: PreferredSize(
          child:AppBar(
              leading: Builder(
                builder: (context) =>  IconButton(
                  iconSize: Adapt.px(35),
                  icon:  Icon(Icons.menu,color: Theme.of(context).accentColor,),
                  onPressed: ()=> Scaffold.of(context).openDrawer(),
                ),
              ),
              title: Row(
                // mainAxisAlignment: ,
                children: <Widget>[
                  new Expanded(
                    child: new Container(

                      //alignment: Alignment.center,
                        child: Text(
                          newsName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: Adapt.px(35),
                            color: Theme.of(context).accentColor,
                          ),
                        )),
                  ),
                  IconButton(
                    iconSize: Adapt.px(35),
                    icon: Icon(Icons.add),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      global.set_photopath(null);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NewsWritting()));
                    },
                  )
                ],
              )),
          preferredSize: Size.fromHeight(Adapt.px(90.0)),
        ) ,
      drawer:   Drawer(
//        child: new Container(
//// color: Theme.of(context).accentColor,
//          color: const Color(0xfff1f2f3),
        child: ListView(
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xffe5e5e5))),
              ),
              child: new Image.asset(
                'lib/images/login4.jpg',
                height: Adapt.px(170),
                fit: BoxFit.cover,
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xffe5e5e5))),
              ),
              child: ListTile(
                leading: Icon(Icons.assignment),
                title: Text('全部随记'),
                trailing: Text('0'),
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xffe5e5e5))),
              ),
              child: ListTile(
                leading: Icon(Icons.favorite),
                title: Text('我的收藏'),
                trailing: Text('0'),
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 5, color: Color(0xffe5e5e5))),
              ),
              child: ListTile(
                leading: Icon(Icons.delete),
                title: Text('最近删除'),
                trailing: Text('0'),
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xffe5e5e5))),
              ),
              child: ListTile(
                title: Text('随记分类'),
                trailing: Text('编辑'),
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xffe5e5e5))),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.book,
                  color: Colors.tealAccent,
                ),
                title: Text('叙事'),
                trailing: Text('0'),
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xffe5e5e5))),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.book,
                  color: Colors.lightBlueAccent,
                ),
                title: Text('抒情'),
                trailing: Text('0'),
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xffe5e5e5))),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.book,
                  color: Colors.lightGreen,
                ),
                title: Text('送别'),
                trailing: Text('0'),
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xffe5e5e5))),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.book,
                  color: Colors.indigoAccent,
                ),
                title: Text('山水田园'),
                trailing: Text('0'),
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xffe5e5e5))),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.book,
                  color: Colors.pink,
                ),
                title: Text('咏物'),
                trailing: Text('0'),
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xffe5e5e5))),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.book,
                  color: Colors.yellow,
                ),
                title: Text('讽喻'),
                trailing: Text('0'),
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xffe5e5e5))),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.book,
                  color: Colors.grey,
                ),
                title: Text('怀古'),
                trailing: Text('0'),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        //盒子装饰器，进行装饰，设置颜色为灰色 ,
        child: _NotesLength == 1
            ? ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Theme.of(context).primaryColor),
                    //盒子装饰器，进行装饰，设置颜色为灰色 ,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NoteShow(title, content)));
                      },
//                  trailing:Text(
//                    Notes.getNowtime(),
//                    style: TextStyle(color: Theme.of(context).accentColor),
//                  ),
                      title: Text(
                        title,
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                      subtitle: Text(
                        content,
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                    ),
                  )
                ],
              )
            : null,
      ),
      //Text('记诗所爱，随从本心'),

     // ),
    );

  }




}

