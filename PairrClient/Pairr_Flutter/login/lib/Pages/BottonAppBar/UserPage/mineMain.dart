import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/Pages/BottonAppBar/UserPage/User_setting.dart';
import 'package:login/Pages/BottonAppBar/UserPage/noLogonSetting.dart';
import 'package:login/Pages/Poem_page/poem_Show.dart';
import 'package:login/Pages/BottonAppBar/UserPage/settingMain.dart';
import 'package:login/scoped_models/ConfigProvide.dart';
import 'package:login/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:login/Pages/Login/loginPage.dart';


class MinePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model){
          if(model.logonstate==false)
            return NoLogonMain();
          else
            return LogonMain();
        }
    );

  }
  
}
class LogonMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model){
            return Scaffold(
               appBar: AppBar(title: Row(
          // mainAxisAlignment: ,
          children: <Widget>[
                 new Expanded(child: new Container(
                alignment: Alignment.center,
                   child: Text('我')),),
                 IconButton(
                  icon: Icon(Icons.settings),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
            )
          ],)),

             body:Container(
          // color: Color(0xffe5e5e5),
          // padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
          // decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
              child:
                new ListView(
            children: <Widget>[
                  new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 25,color: Color(0xffe5e5e5))),),
                //child: logoning(),
              ),
                  new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 25,color: Color(0xffe5e5e5))),),
                    child: Container(
                      child: GestureDetector(
                    onTap: (){

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                        child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                          child: Row(
                        children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(model.userimage),
                                  )
                              )
                          ),
                            new Expanded(child: Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                 new Container(
                                   child: Text(model.username,style: TextStyle(fontSize: 20,fontFamily: 'FontJian'),),
                                 ),
                                 new Container(
                                   child: Text(model.usernumber,style: TextStyle(fontSize: 20,fontFamily: 'FontJian'),),
                                 ),
                               ],
                             ),
                             //
                          )
                          ),
                          new Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Row(
                              children: <Widget>[
                                new Container(
                                  child: Text('更多',style: TextStyle(fontSize: 18),),
                                ),
                                new Container(
                                  child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.arrow_forward_ios),
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
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
                     child:  ListTile(
                      title: Text('收藏',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                       trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
                   new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
                     child:  ListTile(
                      title: Text('随记',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                      trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                    },
                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
                child:  ListTile(
                  title: Text('创作',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 20,color: Color(0xffe5e5e5))),),
                child:  ListTile(
                  title: Text('分享',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
                  new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
                    child:  ListTile(
                     title: Text('通知',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                     trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    //跳出提示框
//              showDialog(
//                  context: context,
//                  child: new SimpleDialog(
//                    contentPadding: const EdgeInsets.all(10.0),
//                    title: new Text("我是标题"),
//                    children: <Widget>[new Text("我是内容区域")],
//                  ));
                  },
                ),
              ),
                  new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 20,color: Color(0xffe5e5e5))),),
                    child:  ListTile(
                     title: Text('推荐',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                     trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
                 new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 20,color: Color(0xffe5e5e5))),),
                  child:  ListTile(
                   title: Text('夜间模式',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                   trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Provide.value<ConfigProvide>(context).$setTheme('deepblack');
                  },
                ),
              ),
                 new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
                  child:  ListTile(
                   title: Text('会员中心',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                   trailing: Icon(Icons.arrow_forward_ios),
                   onTap: () {
                  },
                ),
              ),
                  new Container(
                 decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 20,color: Color(0xffe5e5e5))),),
                   child:  ListTile(
                    title: Text('我的钱包',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                     trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
                  new Container(

                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 20,color: Color(0xffe5e5e5))),),
                   child:  ListTile(
                    title: Text('关于我们',style: TextStyle(fontSize: 18),),
                    //   leading: Icon(Icons.build),
                    trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),




            ],
          ),
        )
        ,
      )
              ;
        }
    )


    ;
  }

}

class NoLogonMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NoLogonMain();
  }

}
class _NoLogonMain extends State<NoLogonMain>{


  bool _switchValue=false ;
  void _switchColor(){
    setState(() {
      if(_switchValue ==true){
        Provide.value<ConfigProvide>(context).$setTheme('deepblack');
        print(Provide.value<ConfigProvide>(context).$setTheme('deepblack'));

      }else{
        Provide.value<ConfigProvide>(context).$setTheme('white');

      }
    });
  }//夜间模式状态
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model){
        //  _switchValue =model.switchValue;
          return Scaffold(
           appBar: AppBar(title: Row(
          // mainAxisAlignment: ,
          children: <Widget>[
            new Expanded(child: new Container(
                alignment: Alignment.center,
                child: Text('我',style: TextStyle(color: Theme.of(context).accentColor ,),),),),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => noLogonSetting()));
              },
            )
          ],)),

        body:Container(
         // color: Color(0xffe5e5e5),
        // padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
         // decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
          child:
          new ListView(
            children: <Widget>[
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 25,color: Color(0xffe5e5e5))),),
                //child: logoning(),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 25,color: Color(0xffe5e5e5))),),
                child: Container(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                      child: Row(
                        children: <Widget>[
                          Container(
                              width: 100,
                              height: 100,
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('lib/images/Nologon.png')
                                  )
                              )
                          ),
                          new Expanded(child: Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text('登录/注册',style: TextStyle(fontSize: 20),),
                          )
                          ),
                          new Container(
                            child: IconButton(
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => LoginPage()));
                              },
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          )
                        ],
                      ),
                    ),

                  ),
                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
                  child:  ListTile(
                  title: Text('通知',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    //跳出提示框
//              showDialog(
//                  context: context,
//                  child: new SimpleDialog(
//                    contentPadding: const EdgeInsets.all(10.0),
//                    title: new Text("我是标题"),
//                    children: <Widget>[new Text("我是内容区域")],
//                  ));
                  },
                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 20,color: Color(0xffe5e5e5))),),
                child:  ListTile(
                  title: Text('推荐',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 20,color: Color(0xffe5e5e5))),),
                child:  ListTile(
                  title: Text('夜间模式',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                  trailing:
                  CupertinoSwitch(
                    value: _switchValue,
                    onChanged: (bool value){
                      setState((){
                        _switchValue =!_switchValue;
                        _switchColor();
                        print('夜间模式状态是$_switchValue');


                        //model.updateSwitchValue(true);
                      });
                    },
                  ),
                  onTap: (){
                    setState(() {
                      _switchValue =!_switchValue;
                     // model.updateSwitchValue(_switchValue);
                    });
                  },

                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
                child:  ListTile(
                  title: Text('会员中心',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 20,color: Color(0xffe5e5e5))),),
                child:  ListTile(
                  title: Text('我的钱包',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
              new Container(

                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 20,color: Color(0xffe5e5e5))),),
                child:  ListTile(
                  title: Text('关于我们',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
            ],
          ),
        )
        ,
      )
            ;

    });



  }



}
