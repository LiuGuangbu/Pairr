import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/Pages/BottonAppBar/UserPage/noLogonSetting.dart';
import 'package:login/Pages/BottonAppBar/UserPage/settingMain.dart';
import 'package:login/scoped_models/Adapt.dart';
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
class LogonMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LogonMain();
  }

}
class _LogonMain extends State<LogonMain>{
  String _ThemeValue = global.getThemeV();
  void _switchColor(){
    setState(() {
      if(global.getSwitchV() ==true){
        Provide.value<ConfigProvide>(context).$setTheme('deepblack');
        //global.setThemeV(string)
      }else{
        Provide.value<ConfigProvide>(context).$setTheme(_ThemeValue);
      }
    });
  }//夜间模式状态
  @override
  void setState(fn) {
    _ThemeValue = global.getThemeV();
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model){
            return Scaffold(
               appBar: AppBar(
                   title: Row(
          // mainAxisAlignment: ,
          children: <Widget>[
                 new Expanded(child: new Container(
                alignment: Alignment.center,
                   child: Text('我',style: TextStyle(  color: Theme.of(context).accentColor ,),)),),
                 IconButton(
                  icon: Icon(Icons.settings),
              color: Theme.of(context).accentColor ,
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
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
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
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
                     child:  ListTile(
                      title: Text('收藏',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                       trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
                   new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
                     child:  ListTile(
                      title: Text('随记',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                      trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                    },
                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
                child:  ListTile(
                  title: Text('创作',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
                child:  ListTile(
                  title: Text('分享',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
                  new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
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
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
                    child:  ListTile(
                     title: Text('推荐',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                     trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
                child:  ListTile(
                  title: Text('夜间模式',style: TextStyle(
                      color: Theme.of(context).accentColor ,
                      fontSize:18),),
                  //   leading: Icon(Icons.build),
                  trailing:
                  CupertinoSwitch(
                    value: global.getSwitchV(),
                    onChanged: (bool value){
                      setState((){
                        global.setSwitchV(!global.getSwitchV()) ;
                        _switchColor();
                        print('夜间模式状态是${global.getSwitchV()}');


                        //model.updateSwitchValue(true);
                      });
                    },
                  ),
                  onTap: (){
                    setState(() {
                      global.setSwitchV(!global.getSwitchV()) ;
                      _switchColor();
                      print('夜间模式状态是${global.getSwitchV()}');
                      // model.updateSwitchValue(_switchValue);
                    });
                  },

                ),
              ),
                 new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(1),color: Theme.of(context).dividerColor)),),
                  child:  ListTile(
                   title: Text('会员中心',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                   trailing: Icon(Icons.arrow_forward_ios),
                   onTap: () {
                  },
                ),
              ),
                  new Container(
                 decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
                   child:  ListTile(
                    title: Text('我的钱包',style: TextStyle(fontSize: 18),),
                  //   leading: Icon(Icons.build),
                     trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                  },
                ),
              ),
                  new Container(

                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
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

  String _ThemeValue = global.getThemeV();
  void _switchColor(){
    setState(() {
      if(global.getSwitchV() ==true){
        Provide.value<ConfigProvide>(context).$setTheme('deepblack');
        //global.setThemeV(string)
      }else{
        Provide.value<ConfigProvide>(context).$setTheme(_ThemeValue);
      }
    });
  }//夜间模式状态
  @override
  void setState(fn) {
    _ThemeValue = global.getThemeV();
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
           appBar: AppBar(

               title: Row(
          // mainAxisAlignment: ,
          children: <Widget>[
            new Expanded(child: new Container(
                alignment: Alignment.center,
                child: Text('我',style: TextStyle(color: Theme.of(context).accentColor ,),),),),
                 IconButton(
                   icon: Icon(Icons.settings),
                   color: Theme.of(context).accentColor ,
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
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
                child: Container(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(Adapt.px(15), Adapt.px(15), 0, Adapt.px(15)),
                      child: Row(
                        children: <Widget>[
                          Container(
                              width:100,
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
                            padding: EdgeInsets.fromLTRB(Adapt.px(15), 0, 0, 0),
                            child: Text('登录/注册',
                              style: TextStyle(
                                color: Theme.of(context).accentColor ,
                                fontSize: Adapt.px(30)),),
                          )
                          ),
                          new Container(
                            child: IconButton(
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => LoginPage()));
                              },
                              icon: Icon(Icons.arrow_forward_ios,color:Theme.of(context).accentColor ,),
                            ),
                          )
                        ],
                      ),
                    ),

                  ),
                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(1),color: Theme.of(context).dividerColor)),),
                  child:  ListTile(
                  title: Text('通知',style: TextStyle(
                      color: Theme.of(context).accentColor ,
                      fontSize: Adapt.px(30)),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios,color:Theme.of(context).accentColor ,),
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
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
                child:  ListTile(
                  title: Text('推荐',style: TextStyle(
                      color: Theme.of(context).accentColor ,
                      fontSize:Adapt.px(30)),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios,color:Theme.of(context).accentColor ,),
                  onTap: () {
                  },
                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
                child:  ListTile(
                  title: Text('夜间模式',style: TextStyle(
                      color: Theme.of(context).accentColor ,
                      fontSize:Adapt.px(30)),),
                  //   leading: Icon(Icons.build),
                  trailing:
                  CupertinoSwitch(
                    value: global.getSwitchV(),
                    onChanged: (bool value){
                      setState((){
                        global.setSwitchV(!global.getSwitchV()) ;
                        _switchColor();
                        print('夜间模式状态是${global.getSwitchV()}');


                        //model.updateSwitchValue(true);
                      });
                    },
                  ),
                  onTap: (){
                    setState(() {
                      global.setSwitchV(!global.getSwitchV()) ;
                      _switchColor();
                      print('夜间模式状态是${global.getSwitchV()}');
                     // model.updateSwitchValue(_switchValue);
                    });
                  },

                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
                child:  ListTile(
                  title: Text('会员中心',style: TextStyle(
                      color: Theme.of(context).accentColor ,
                      fontSize:Adapt.px(30)),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios,color:Theme.of(context).accentColor ,),
                  onTap: () {
                  },
                ),
              ),
              new Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
                child:  ListTile(
                  title: Text('我的钱包',style: TextStyle(
                      color: Theme.of(context).accentColor ,
                      fontSize:Adapt.px(30)),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios,color:Theme.of(context).accentColor ,),
                  onTap: () {
                  },
                ),
              ),
              new Container(

                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(18),color: Theme.of(context).dividerColor)),),
                child:  ListTile(
                  title: Text('关于我们',style: TextStyle(
                      color: Theme.of(context).accentColor ,
                      fontSize:Adapt.px(30)),),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(Icons.arrow_forward_ios,color:Theme.of(context).accentColor ,),
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
