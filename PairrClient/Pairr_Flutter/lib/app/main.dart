import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../search/search.dart';
import '../photo/photo.dart';
import 'package:text03/photo_wave/animation_page.dart';
import '../search/splash_screen.dart';
//import 'searchList.dart';
//import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       // primarySwatch:Colors.white,
      ),
      home:
      //AnimationPage(),
      SplashScreen()
    );
  }
}
// }
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home:FirstScreen());
//   }
// }

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Pairr'),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage(
                'https://ss0.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=622084731,3469767921&fm=26&gp=0.jpg'
                //'http://img.9ku.com/geshoutuji/singertuji/5/53172/53172_1.jpg'
                //'http://image.biaobaiju.com/uploads/20181007/11/1538883626-BfVnwWKgDX.jpg'
               // 'http://pic141.nipic.com/file/20170918/21948267_135654045000_2.jpg'
                //'https://c-ssl.duitang.com/uploads/blog/201308/07/20130807094529_wu8V4.thumb.700_0.jpeg'
                // 'http://img.sccnn.com/bimg/337/32041.jpg'
              ),
             // image: AssetImage("image/1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        child: Column(
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: Container(
//                decoration:BoxDecoration(
//                  border: Border.all(width: 0.0)
//                ) ,
                padding:EdgeInsets.fromLTRB(25, 22, 25,22) ,
                child: Container(
                  child:new Container(

                    alignment: Alignment.center,
                    //  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    //  color: Colors.red,
                    child: new Opacity(
                      opacity: 0.4,//搜索框透明度
                      child:new Container(
                        height: 200.0,
                        color: Colors.grey,
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Expanded(
                          flex:2,
                            child: new IconButton(
                              color: Colors.grey[100],

                             // alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                              icon: new Icon(
                                Icons.search,size:40.0,
                               color: Colors.white,
                              ),
                              tooltip: '搜索操作',
                              onPressed: (){
                                showSearch(context: context, delegate: searchBarDelegate());
                                //showSearch(context: context, delegate: searchBarDelegate());
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBarDemo()));
                                print('搜索操作');
                              },
                            )
                        ),
                        new Expanded(
                          flex: 7,
                            child:new GestureDetector(
                                onTap: (){
                                  showSearch(context: context, delegate: searchBarDelegate());
                                },
                                child: new Container(
                                 // width: 500.0,
                                  //padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                                 // color: Colors.green,
                                  child: Text('搜索',textAlign: TextAlign.left,style: TextStyle(color:Colors.white,fontSize: 25),),

                                ),
                            ),
                        ),
                        new Expanded(
                            flex:2,
                            child: new IconButton(
                              color: Colors.grey[100],
                              //alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                              icon: new Icon(Icons.settings_voice,size:35.0,color: Colors.white,),
                              tooltip: '语音操作',
                              onPressed: (){
                               // Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBarDemo()));
                                print('语音操作');
                              },
                            )
                        ),
                      ],
                    ),),),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)
                  ),

                ),

              ),
            ),
            new Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Expanded(

                        child:Container(

                          child:Text(
                            '每日推荐',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontFamily: '隶书',fontSize: 17.0,),
                          ),
                        )
                    ),
                    new Expanded(
                        flex:3,
                        child:Container(
                          width: 400.0,
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              new Container(

                                child:Text(
                                 "岱宗夫如何？齐鲁青未了。",
                                  strutStyle: StrutStyle(leading: 2),//行间距
                                  style: TextStyle(
                                   // fontWeight: FontWeight.bold,//字体粗细
                                    fontSize: 20,
                                    //fontStyle: FontStyle.italic,//倾斜,斜体,normal正常
                                    // decoration: TextDecoration.underline,//修饰线（下划线、上划线、删除线）
                                    // decoration: TextDecoration.underline, decorationColor: Colors.red) //decorationColor用来指定修饰线的颜色，

                                  ),
                                ),
                              ),
                              new Container(

                                child:Text(
                                  "造化钟神秀，阴阳割昏晓。",
                                  strutStyle: StrutStyle(leading: 2),//行间距
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,//字体粗细
                                    fontSize: 20,
                                    //fontStyle: FontStyle.italic,//倾斜,斜体,normal正常
                                    // decoration: TextDecoration.underline,//修饰线（下划线、上划线、删除线）
                                    // decoration: TextDecoration.underline, decorationColor: Colors.red) //decorationColor用来指定修饰线的颜色，

                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                )

              ),
            ),
            new Expanded(
              flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 150),
                    child: new Opacity(
                      opacity: 0.3,
                      child:Center(
                        child:HomePage() ,
                    ),)
                    //home_Photo(),
                )
            ),
            new Expanded(
              flex: 1,
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  
                  new Container(
                    
                     // flex: 5,
                      child: Center(
                        
                          child:new IconButton(
                           // color:Colors.blue,
                            icon: new Icon(Icons.home,size:40.0,color: Colors.blue,),
                            tooltip: '首页',
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                              print('首页');
                            },
                          )

                      )
                  ),
                  new Container(
                     // flex: 5,
                      child: Center(
                          child:new IconButton(
                           // color:Colors.blue,
                            icon: new Icon(Icons.rate_review,size:40.0,color: Colors.blue,),
                            tooltip: '随记',
                            onPressed: (){
                              print('随记');
                            },
                          )

                      )
                  ),
                  new Container(
                      //flex: 5,
                      child: Center(
                          child:new IconButton(
                           // color:Colors.blue,
                            icon: new Icon(Icons.person,size:40.0,color: Colors.blue,),
                            tooltip: '个人首页',
                            onPressed: (){
                              print('个人首页');
                            },
                          )

                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

