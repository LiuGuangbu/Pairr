import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//密码登陆
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //焦点
  FocusNode _focusNodeUName = new FocusNode();
  FocusNode _focusNodePassword = new FocusNode();

  //控制器  用户名电话号  密码
  TextEditingController _UNameController = new TextEditingController();
  TextEditingController _PasswordController = new TextEditingController();

  var _username = '';  //用户名或者手机号
  var _password = '';  //密码
  var _isShowPassword = false;  //是否显示密码
  var _isShowClear = false;  //是否显示输入框尾部的清除按钮，默认不显示

  //监听焦点
  Future<Null> _focusNodeListener() async{
    if (_focusNodeUName.hasFocus){
      print("用户名框获取焦点");
      //取消密码框的焦点状态
      _focusNodePassword.unfocus();
    }
    else if (_focusNodePassword.hasFocus){
      print("密码框获取焦点");
      //取消用户名框交电状态
      _focusNodeUName.unfocus();
    }
  }

  @override
  void initState()  {
    //设置焦点监听
    _focusNodeUName.addListener(_focusNodeListener);
    _focusNodePassword.addListener(_focusNodeListener);
    //监听用户矿的输入改变
    _UNameController.addListener((){
      print(_UNameController.text);
      //监听文本框输入变化，当有内容时，显示尾部清除按钮，否则不显示
      if (_UNameController.text.length > 0){
        _isShowClear = true;
      }else{
        _isShowClear = false;
      }
      setState(() {

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    //移除焦点监听
    _focusNodeUName.removeListener(_focusNodeListener);
    _focusNodePassword.removeListener(_focusNodeListener);
    _UNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录'),),
      body: GestureDetector(
        onTap: (){
          print("点击了空白区域");
          _focusNodeUName.unfocus();
          _focusNodePassword.unfocus();
        },
        child: ListView(
          children: <Widget>[
        // logo 图片区域

            Padding(
              padding: EdgeInsets.only(left: 44,top: 97),
              child:  Text('你好，',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 44,top: 10),
              child:  Text('欢迎来到注册界面',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
            ),
            Padding(
              padding: EdgeInsets.only(top: 39),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(44, 0, 44, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width-88,
                    color: Color(0XFFF2F3F7),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 40,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('+86'),
                          ),
                        ),
                        Container(
                          width: 20,
                          child: Image(
                            image: AssetImage("lib/images/pic2.jpg"),
                            width: 12,
                            height: 7,
                          ),
                        ),
                        Container(
                          width:  197,
                          child:    Padding(
                            padding: EdgeInsets.all(0),
                            child:Stack(
                              children: <Widget>[
                                Positioned(
                                  child: TextField(
                                    autofocus: true,
                                    controller: _UNameController,
                                    focusNode: _focusNodeUName,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: '请输入手机号',
                                      border: InputBorder.none,
                                      //尾部添加清除按钮
                                      suffixIcon: (_isShowClear) ? IconButton(icon: Icon(Icons.clear),
                                        onPressed: (){
                                          //清空内容
                                          _UNameController.clear();
                                          _PasswordController.clear();
                                        },) : null,
                                    ),
                                  ),
                                )
                              ],
                            ) ,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                height: 50,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(44, 0, 44, 0),
                  child: Container(
                    width: 272,
                    color: Color(0XFFF2F3F7),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 272,
                          child: Padding(
                            padding: EdgeInsets.all(0),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  left: 10,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: TextField(
                                    autofocus: true,
                                    controller: _PasswordController,
                                    focusNode: _focusNodePassword,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: '请输入密码',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 44,top: 24),
              child: Container(
                width: 272,
                height: 30,
                child: Stack(
                  children: <Widget>[
                    Positioned(

                      child: GestureDetector(
                        onTap: (){ Navigator.pushNamed(context, "login_checkCode"); },
                        child: Text('验证码登录'),
                      ),
                    ),
                    Positioned(
                      left: 192,
                      child: GestureDetector(
                        onTap: (){ Navigator.pushNamed(context, "login_forgetPassword"); },
                        child: Text('忘记密码 ？'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 44,top: 66,right: 44),
                child: Container(
                  height: 45,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: FlatButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          highlightColor: Colors.blue[700],
                          colorBrightness: Brightness.dark,
                          splashColor: Colors.grey,
                          child: Text('进入修派'),
                          onPressed: (){
                            //点击后，解除焦点，回收键盘
                            _focusNodeUName.unfocus();
                            _focusNodePassword.unfocus();
                          },  //点击事件---回调函数
                        ),
                      )
                    ],
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.only(left: 44,top: 78,right: 44),
              child: Container(
                width: 272,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Text('------------------------------------------- 第三方登录 -------------------------'),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 29),
              child: Container(
                width: MediaQuery.of(context).size.width,  //屏幕的宽度
                height: 40,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 80,
                      child: GestureDetector(
                        onTap: (){ Navigator.pushNamed(context, "login_third"); },
                        child: Image(
                          image: AssetImage("lib/images/pic2.jpg"),
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 160,
                      child: GestureDetector(
                        onTap: (){ Navigator.pushNamed(context, "login_third"); },
                        child: Image(
                          image: AssetImage("lib/images/pic2.jpg"),
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 240,
                      child: GestureDetector(
                        onTap: (){ Navigator.pushNamed(context, "login_third"); },
                        child: Image(
                          image: AssetImage("lib/images/pic2.jpg"),
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

