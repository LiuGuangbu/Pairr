import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/Pages/BottonAppBar/UserPage/noLogonSetting.dart';
import 'package:login/Pages/BottonAppBar/UserPage/settingMain.dart';
import 'package:login/Utils/Adapt.dart';
import 'package:login/Utils/ConfigProvide.dart';
import 'package:login/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:login/Pages/BottonAppBar/UserPage/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (global.get_logonstate()?LogonMain():NoLogonMain());
  }
}

class LogonMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LogonMain();
  }
}

class _LogonMain extends State<LogonMain> {
  String _ThemeValue = global.getThemeV();

  void _switchColor() async {
    setState(() async {
      if (global.getSwitchV() == true) {
        Provide.value<ConfigProvide>(context).$setTheme('deepblack');
        final prefs = await SharedPreferences.getInstance();
        prefs.setDouble('opacity', 0.7);
        // global.setOpacity(0.7);
      } else {
        Provide.value<ConfigProvide>(context).$setTheme('white');
        final prefs = await SharedPreferences.getInstance();
        prefs.setDouble('opacity', 1.0);
        //global.setOpacity(1.0);

      }
    });
  } //夜间模式状态

  @override
  void setState(fn) {
    _ThemeValue = global.getThemeV();
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            leading: Text(
              '',
              style: TextStyle(
                color: Colors.transparent,
              ),
            ),
            title: Container(
              alignment: Alignment.center,
              child: Text(
                '我',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Adapt.px(35),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),

            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.settings,
                  size: Adapt.px(35),
                ),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingPage()));
                },
              )
            ],
          ),
          preferredSize: Size.fromHeight(Adapt.px(90)),
        ),
        body: Container(
          // color: Color(0xffe5e5e5),
          // padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
          // decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
          child: new ListView(
            children: <Widget>[
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(18),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: Container(
                  child: GestureDetector(
                    onTap: () {
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(
                          Adapt.px(15), Adapt.px(15), 0, Adapt.px(15)),
                      child: Row(
                        children: <Widget>[
                          Container(
                              width: Adapt.px(130),
                              height: Adapt.px(130),
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(Adapt.px(15))),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(global.get_userimage()),
                                  ))),
                          new Expanded(
                              child: Container(
                            padding: EdgeInsets.fromLTRB(Adapt.px(15), 0, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  child: Text(
                                    global.get_username(),
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: Adapt.px(28),
                                        fontFamily: 'FontJian'),
                                  ),
                                ),
                                new Container(
                                  child: Text(
                                    global.get_usernumber(),
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: Adapt.px(28),
                                        fontFamily: 'FontJian'),
                                  ),
                                ),
                              ],
                            ),
                            //
                          )),
                          new Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Row(
                              children: <Widget>[
                                new Container(
                                  child: Text(
                                    '更多',
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: Adapt.px(28),
                                    ),
                                  ),
                                ),
                                new Container(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: Adapt.px(30),
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '收藏',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '随记',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '创作',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(18),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '分享',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '通知',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(18),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '推荐',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(18),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '夜间模式',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: CupertinoSwitch(
                    value: global.getSwitchV(),
                    onChanged: (bool value) {
                      setState(() {
                        global.setSwitchV(!global.getSwitchV());

                        _switchColor();
//                        if (global.getSwitchV() == true) {
//                          Provide.value<ConfigProvide>(context).$setTheme('deepblack');
//                          model.undateOpacity(0.7);
//                          // global.setOpacity(0.7);
//                        } else {
//                          Provide.value<ConfigProvide>(context).$setTheme('white');
//                          model.undateOpacity(1.0);
//                          // global.setOpacity(1.0);
//
//                        }
                        print('夜间模式状态是${global.getSwitchV()}');

                        //model.updateSwitchValue(true);
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      global.setSwitchV(!global.getSwitchV());
                      _switchColor();
//                      if (global.getSwitchV() == true) {
//                        Provide.value<ConfigProvide>(context).$setTheme('deepblack');
//                        model.undateOpacity(0.7);
//                        // global.setOpacity(0.7);
//                      } else {
//                        Provide.value<ConfigProvide>(context).$setTheme('white');
//                        model.undateOpacity(1.0);
//                        // global.setOpacity(1.0);
//
//                      }
                      print('夜间模式状态是${global.getSwitchV()}');
                      // model.updateSwitchValue(_switchValue);
                    });
                  },
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '会员中心',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(18),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '我的钱包',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '关于我们',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      );

  }
}

class NoLogonMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NoLogonMain();
  }
}

class _NoLogonMain extends State<NoLogonMain> {
  String _ThemeValue = global.getThemeV();

  void _switchColor() async {
    setState(() async {
      if (global.getSwitchV() == true) {
        Provide.value<ConfigProvide>(context).$setTheme('deepblack');
        final prefs = await SharedPreferences.getInstance();
        prefs.setDouble('opacity', 0.7);
        // global.setOpacity(0.7);
      } else {
        Provide.value<ConfigProvide>(context).$setTheme('white');
        final prefs = await SharedPreferences.getInstance();
        prefs.setDouble('opacity', 1.0);
        //global.setOpacity(1.0);

      }
    });
  }

  @override
  void setState(fn) {
    _ThemeValue = global.getThemeV();
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            leading: Text(
              '',
              style: TextStyle(
                color: Colors.transparent,
              ),
            ),
              title: Container(
                alignment: Alignment.center,
                child: Text(
                  '我',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Adapt.px(35),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.settings,
                  size: Adapt.px(35),
                ),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => noLogonSetting()));
                },
              )
            ],
          ),
          preferredSize: Size.fromHeight(Adapt.px(90)),
        ),
        body: Container(
          // color: Color(0xffe5e5e5),
          // padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
          // decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
          child: new ListView(
            children: <Widget>[
              new Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(18),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: Container(
                  decoration: new BoxDecoration(
                      color: Theme.of(context).primaryColor
                      // border: new Border.all(width: 2.0, color: Colors.red),
                      ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(
                          Adapt.px(15), Adapt.px(15), 0, Adapt.px(15)),
                      child: Row(
                        children: <Widget>[
                          Container(
                              width: Adapt.px(130),
                              height: Adapt.px(130),
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(Adapt.px(15))),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'lib/images/Nologon.png')))),
                          new Expanded(
                              child: Container(
                            padding: EdgeInsets.fromLTRB(Adapt.px(15), 0, 0, 0),
                            child: Text(
                              '登录/注册',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: Adapt.px(28)),
                            ),
                          )),
                          new Container(
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: Adapt.px(30),
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '通知',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(18),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '推荐',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(18),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '夜间模式',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: CupertinoSwitch(
                    value: global.getSwitchV(),
                    onChanged: (bool value) {
                      setState(() {
                        global.setSwitchV(!global.getSwitchV());
                        _switchColor();

                        print('夜间模式状态是${global.getSwitchV()}');

                        //model.updateSwitchValue(true);
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      global.setSwitchV(!global.getSwitchV());
                      _switchColor();
                      print('夜间模式状态是${global.getSwitchV()}');
                      // model.updateSwitchValue(_switchValue);
                    });
                  },
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '会员中心',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(18),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '我的钱包',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Theme.of(context).dialogBackgroundColor)),
                ),
                child: ListTile(
                  title: Text(
                    '关于我们',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Theme.of(context).accentColor,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      );
  }
}
