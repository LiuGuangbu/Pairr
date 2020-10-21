import 'dart:ui' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter_qq/flutter_qq.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/Pages/BottonAppBar/UserPage/registerPage.dart';
import 'dart:convert' as convert;
import 'package:login/Utils/Adapt.dart';
import 'package:login/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:login/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();

  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _PasswordController = new TextEditingController();

  //表单状态
 // GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _password = ''; //密码
  String _username = ''; //用户名
  var _isShowPwd = false; //是否显示密码
  var _isShowClear = false; //是否显示输入框尾部的清除按钮
  bool _isShowPwd_Node = false; //触碰密码框
  bool _isShowClear_Node = false; //触碰用户框
  var  _list;
  var User_decide =false;
  var Pass_decide = false;
  var Dui ;
  @override
  void initState() {
    // TODO: implement initState
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    _PasswordController.addListener(() {
      print(_PasswordController.text);

      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (_PasswordController.text.length > 0) {
        _isShowPwd_Node = true;
      }
      setState(() {});
    });
    //监听用户名框的输入改变
    _userNameController.addListener(() {
      print(_userNameController.text);

      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (_userNameController.text.length > 0) {
        _isShowClear = true;
        _isShowClear_Node = true;
      } else {
        _isShowClear = false;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // 移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
    setState(() {
      _getdata();
    });
  }
  Future _getdata() async {
    print('开始请求了！！！');
    var apiUrl = global.get_apiUrllogin();

    String apiSearch = _userNameController.text; //内容
    String apiSearch1= _PasswordController.text;
    var response = await http.post(apiUrl, body: {'phoneNumber': apiSearch,'password': apiSearch1});
    print(response.body);
    //var response = await http.post(apiUrl,body:{'label':'今晚的月亮好美啊'});
    if (response.statusCode == 200) {
      //  print(convert.jsonDecode(response.body));
      setState(() {
        this._list = convert.jsonDecode(response.body);
        print('得到登录数据是：${this._list}');
        Dui =this._list;
        if(_list is String)
          {
            print("List is String");

          }
        else if(_list is bool)
          {
            print("list is bool");
          }
        else{
          print("both no");
        }
        print("Dui的值是$Dui");

//

      });
    } else {
      print('失败: ${response.statusCode}');
      Dui = 'false';
    }
    print('请求结束了！！！');
  }

  // 监听焦点
  Future<Null> _focusNodeListener() async {
    if (_focusNodeUserName.hasFocus) {
      print("用户名框获取焦点");
      // 取消密码框的焦点状态
      setState(() {
        _focusNodePassWord.unfocus();
        _isShowClear_Node = true;
      });
    } else {
      setState(() {
        _isShowClear_Node = false;
      });
    }
    if (_focusNodePassWord.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框焦点状态

      setState(() {
        _focusNodeUserName.unfocus();
        _isShowPwd_Node = true;
      });
    } else {
      setState(() {
        _isShowPwd_Node = false;
      });
    }
  }
  //qq登录
  List<File> _images = new List();
  String _output = '---';
  Future<Null> _handleLogin() async {
    try {
      var qqResult = await FlutterQq.login();
      var output;
      if (qqResult.code == 0) {
        if(qqResult.response==null){
          output = "登录成功qqResult.response==null";
          return;
        }
        output = "登录成功" + qqResult.response.toString();
      } else {
        output = "登录失败" + qqResult.message;
      }
      setState(() {
        _output = output;
      });
    } catch (error) {
      print("flutter_plugin_qq_example:" + error.toString());
    }
  }



  /**
   * 验证用户名
   */
//  String validateUserName(value) {
//    // 正则匹配手机号
//    RegExp exp = RegExp(
//        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
//    if (value.isEmpty) {
//      return '用户名不能为空!';
//    } else if (!exp.hasMatch(value)) {
//      return '请输入正确手机号';
//    }
//    return null;
//  }

  /**
   * 验证密码
   */
//  String validatePassWord(value) {
//    if (value.isEmpty) {
//      return '密码不能为空';
//    } else if (value.trim().length < 6 || value.trim().length > 18) {
//      return '密码长度不正确';
//    }
//    return null;
//  }

  @override
  Widget build(BuildContext context) {
    FlutterQq.registerQQ('101843618');
    // TODO: implement build
    return Opacity(
        opacity: 1.0,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('lib/images/ground7.jpg'),
            fit: BoxFit.fill,
          )),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: <Widget>[
                  ConstrainedBox(
                      //约束盒子组件，添加额外的限制条件到 child上。
                      constraints: const BoxConstraints.expand(),
                      //限制条件，可扩展的。
                      child: Image.asset(
                        'lib/images/ground7.jpg',
                        fit: BoxFit.fill,
                      )),
                  Center(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter:
                            prefix0.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Opacity(
                          opacity: 0.3,
                          child: Container(
                            width: Adapt.screenW(),
                            height: Adapt.screenH(),
                            decoration:
                                BoxDecoration(color: Colors.grey.shade200),
                            //盒子装饰器，进行装饰，设置颜色为灰色 ,
                            child: null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        print('点击了空白区域');
                        _focusNodePassWord.unfocus();
                        _focusNodeUserName.unfocus();
                      },
                      child: ListView(

                        children: <Widget>[
                          ListTile(
                            leading: new IconButton(
                              icon: new Icon(
                                Icons.arrow_back_ios,
                                size: Adapt.px(35),
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  global.set_logonstate(false);
                                  Navigator.of(context)
                                      .pushAndRemoveUntil(
                                      new MaterialPageRoute(
                                        builder:
                                            (context) =>
                                            MyHomePage(),
                                      ),
                                          (route) =>
                                      route ==
                                          null);
                                });
                              },
                              //onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.fromLTRB(0, Adapt.px(10), 0, Adapt.px(40)),
                            alignment: Alignment.center,
                            // 设置图片为圆形
                            child: ClipOval(
                              child: Image.asset(
                                "lib/images/login_logo.PNG",
                                height: Adapt.px(150),
                                width: Adapt.px(150),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          new Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.black12),
                            //盒子装饰器，进行装饰，设置颜色为灰色 ,
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                            margin: EdgeInsets.only(left: Adapt.px(40), right: Adapt.px(40)),
                            child: new Form(
                              //key: _formKey,
                              child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new TextFormField(
                                    controller: _userNameController,
                                    focusNode: _focusNodeUserName,
                                    //设置键盘类型
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: Adapt.px(25),
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "用户名",
                                      labelStyle: TextStyle(
                                        fontSize: (_isShowClear_Node)
                                            ? 0.0
                                            : Adapt.px(25),
                                        color: (_isShowClear_Node)
                                            ? Colors.transparent
                                            : Colors.white,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: Adapt.px(25),
                                        color: Colors.white,
                                      ),
                                      hintText: "请输入手机号",
                                      helperText: (User_decide)?'用户名不能为空':null,
                                      helperStyle: TextStyle(fontSize: Adapt.px(30),color: Colors.red),
                                      prefixIcon: Icon(Icons.person,
                                        color: Colors.white,),
                                      //尾部添加清除按钮
                                      suffixIcon: (_isShowClear)
                                          ? IconButton(
                                              icon: Icon(
                                                Icons.clear,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                // 清空输入框内容
                                                _PasswordController.clear();
                                                _userNameController.clear();
                                              },
                                            )
                                          : null,
                                    ),
                                    //验证用户名
                                 //   validator: validateUserName,
                                    //保存数据

//                                    onSaved: (String value) {
//                                      _username = value;
//                                      model.updateUsernumber(_username);
//                                    },
                                  ),
                                  new TextFormField(
                                    controller: _PasswordController,
                                    focusNode: _focusNodePassWord,
                                    style: TextStyle(
                                      fontSize: Adapt.px(25),
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                        labelText: "密码",
                                        labelStyle: TextStyle(
                                            fontSize: (_isShowPwd_Node)
                                                ? 0.0
                                                : Adapt.px(25),
                                            color: (_isShowPwd_Node)
                                                ? Colors.transparent
                                                :  Colors.white,),
                                        hintStyle: TextStyle(
                                          fontSize: Adapt.px(25),
                                          color: Colors.white,
                                        ),
                                        hintText: "请输入密码",
                                        helperText: (Pass_decide)?'密码不能为空':null,
                                        helperStyle: TextStyle(fontSize: Adapt.px(30),color: Colors.red),

                                        prefixIcon: Icon(Icons.lock,
                                          color: Colors.white,),
                                        // 是否显示密码
                                        suffixIcon: IconButton(
                                          color: Colors.white,
                                          icon: Icon((_isShowPwd)
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                          // 点击改变显示或隐藏密码
                                          onPressed: () {
                                            setState(() {
                                              _isShowPwd = !_isShowPwd;
                                            });
                                          },
                                        )),
                                    obscureText: !_isShowPwd,
                                    //密码验证
                                  //  validator: validatePassWord,
                                    //保存数据
//                                    onSaved: (String value) {
//                                      _password = value;
//                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.only(top: Adapt.px(10)),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: Adapt.px(40), right: Adapt.px(40),top: Adapt.px(40)),

                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    _focusNodePassWord.unfocus();//点击登录按钮，解除焦点，回收键盘
                                    _focusNodeUserName.unfocus();
                                    setState(() {

                                      if(_userNameController.text ==''||_PasswordController.text == '')
                                      {
                                        setState(() {
                                          showCupertinoDialog(
                                            context: context,
                                            builder: (context) {
                                              return CupertinoAlertDialog(
                                                title:  new Text(
                                                  '账号、密码不能为空哦。',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Adapt.px(28)),
                                                ),
                                                actions: [
                                                  CupertinoDialogAction(
                                                    child: Text('确认'),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                  // CupertinoDialogAction(
                                                  //   child: Text('取消'),
                                                  //   isDestructiveAction: true,
                                                  //   onPressed: () {
                                                  //     Navigator.of(context).pop();
                                                  //   },
                                                  // ),
                                                ],
                                              );
                                            },
                                          );
                                        });
                                      }
                                      else

                                        //  if(User_decide==false&&Pass_decide==false)
                                          {
                                        setState(() {
                                          _getdata();
                                          print(Dui);
                                          if (Dui == true) {
                                            setState(() {
                                              showCupertinoDialog(
                                                context: context,
                                                builder: (context) {
                                                  return CupertinoAlertDialog(
                                                    title: new Text(
                                                      '恭喜您！登录成功！！',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Adapt.px(28)),
                                                    ),
                                                    actions: [
                                                      CupertinoDialogAction(
                                                        child: Text('确认'),
                                                        onPressed: () {
                                                          setState(() {
                                                            global.set_logonstate(true);
                                                            global.set_usernumber(_username);
                                                            Navigator.of(context)
                                                                .pushAndRemoveUntil(
                                                                new MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                      MyHomePage(),
                                                                ),
                                                                    (route) =>
                                                                route ==
                                                                    null);
                                                          });
                                                        },
                                                      ),
                                                      // CupertinoDialogAction(
                                                      //   child: Text('取消'),
                                                      //   isDestructiveAction: true,
                                                      //   onPressed: () {
                                                      //     Navigator.of(context).pop();
                                                      //   },
                                                      // ),
                                                    ],
                                                  );
                                                },
                                              );
                                            });



                                          }
                                          if(Dui==false)
                                          {
                                            setState(() {
                                              showCupertinoDialog(
                                                context: context,
                                                builder: (context) {
                                                  return CupertinoAlertDialog(
                                                    title: new Text(
                                                      '账号、密码不正确哦！',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: Adapt.px(28)),
                                                    ),
                                                    actions: [
                                                      CupertinoDialogAction(
                                                        child: Text('确认'),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                      // CupertinoDialogAction(
                                                      //   child: Text('取消'),
                                                      //   isDestructiveAction: true,
                                                      //   onPressed: () {
                                                      //     Navigator.of(context).pop();
                                                      //   },
                                                      // ),
                                                    ],
                                                  );
                                                },
                                              );
                                            });

                                          }
                                        });


                                      }


                                    });
                                    // ignore: unrelated_type_equality_checks

                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: Adapt.px(20)),
                                    padding: EdgeInsets.all(Adapt.px(15)),
                                    width: Adapt.screenW(),
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      // border: new Border.all(width: 2.0, color: Colors.red),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(8.0)),
                                    ),
                                    child: Text(
                                      "登录",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: Adapt.px(28),
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>RegisterPage()));

                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(Adapt.px(15)),
                                    width: Adapt.screenW(),
                                    decoration: new BoxDecoration(
                                      //  color: Colors.blue,
                                      border: new Border.all(
                                          width: 2.0,
                                        color: Colors.white,),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(8.0)),
                                    ),
                                    child: Text(
                                      "注册",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: Adapt.px(28),
                                        color: Colors.white,),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(Adapt.px(15)),
                                    width: Adapt.screenW(),
                                    child: Text(
                                      "忘了密码？",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: Adapt.px(20),
                                        color: Colors.white,),
                                    ),
                                  ),
                                ),
                                new Container(
                                  margin:EdgeInsets.only(top: Adapt.px(20),bottom: Adapt.px(20)),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: Adapt.px(50),
                                        height: 1.0,
                                        color: Colors.white,
                                      ),
                                     Text(
                                    "第三方登录",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: Adapt.px(18),
                                        color: Colors.white,
                                    ),
                                  ),
                                      Container(
                                        width: Adapt.px(50),
                                        height: 1.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                new Container(
                                  child: new Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[

                                      IconButton(
                                        color: Colors.white,
                                        // 第三方库icon图标
                                        icon: Icon(FontAwesomeIcons.qq),
                                        iconSize: Adapt.px(50),
                                        onPressed: _handleLogin,
                                      ),
                                      IconButton(
                                        color: Colors.white,
                                        // 第三方库icon图标
                                        icon: Icon(FontAwesomeIcons.weixin),
                                        iconSize: Adapt.px(50),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        color: Colors.white,
                                        icon:
                                        Icon(FontAwesomeIcons.facebook),
                                        iconSize: Adapt.px(50),
                                        onPressed: () {},
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      );
  }
}

