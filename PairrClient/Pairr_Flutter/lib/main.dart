import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'search.dart';
import 'photo.dart';
import 'splash_screen.dart';
//import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      home:SplashScreen()
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
                padding:EdgeInsets.fromLTRB(20, 12, 20,12) ,
                child: Container(
                  child:new Container(
                    alignment: Alignment.center,
                    //  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    //  color: Colors.red,
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
                                Icons.search,size:35.0,
                               color: Colors.grey,
                              ),
                              tooltip: '搜索操作',
                              onPressed: (){
                                showSearch(context: context, delegate: searchBarDelegate());
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBarDemo()));
                                print('搜索操作');
                              },
                            )
                        ),
                        new Expanded(
                          flex: 7,
                            child: new RaisedButton(
                              color: Colors.grey[300],
                               onPressed: (){
                                 showSearch(context: context, delegate: searchBarDelegate());
                                 //Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBarDemo()));
                               },
                              child: Text('搜索',textAlign: TextAlign.left,),
                              
  
                            )
                        ),
                        new Expanded(
                            flex:2,
                            child: new IconButton(
                              color: Colors.grey[100],
                              //alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                              icon: new Icon(Icons.settings_voice,size:30.0,color: Colors.grey,),
                              tooltip: '语音操作',
                              onPressed: (){
                               // Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBarDemo()));
                                print('语音操作');
                              },
                            )
                        ),
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)
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
                            '每日一首诗',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontFamily: '隶书',fontSize: 15.0,),
                          ),
                        )
                    ),
                    new Expanded(
                        flex:3,
                        child:Container(
                          child:Text(
                            '山无陵，江水为竭，冬雷震震，夏雨雪，天地合，乃敢与君绝。',
                            style: TextStyle(fontFamily: '隶书',fontSize: 20.0,),
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
                  padding: EdgeInsets.fromLTRB(0, 0, 160, 90),
                    child:new IconButton(
                      icon: new Icon(Icons.add_a_photo,size:180.0,color: Colors.blue[500]),
                      tooltip: '拍照',
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        print('拍照');
                      },
                    )

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



//            RaisedButton(onPressed: (){
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBarDemo()));
//            },
//              child: Text("搜索点击跳转"),),
//            RaisedButton(onPressed: (){
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//            },
//              child: Text("拍照点击跳转"),),



          ],
        ),
      ),
    );
  }
}

