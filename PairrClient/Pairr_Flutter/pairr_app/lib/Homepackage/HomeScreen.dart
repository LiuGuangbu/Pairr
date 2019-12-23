import 'package:flutter/material.dart';
import 'package:pairr_app/Search/search.dart';
import 'package:pairr_app/Photo/photo.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text('此诗词客'),
        ),
        body:Center(
          child: Container(
            decoration: BoxDecoration(
               image: DecorationImage(
                  image: AssetImage("images/bg.png"),
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
                                child:GestureDetector(
                                  child:new Container(
                                    alignment: Alignment.center,
                                    //color: Colors.red,
                                    child:Image.asset('images/yuyin4.png',width: 40.0,height: 40.0,),
                                  ),
                                onTap: (){
                                    //语音链接
                                },),
                               // Image.asset('images/yuyin4.png',width: 40.0,height: 40.0,),
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
            ), new Expanded(
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

              ],
            ),
        )
        )
    );
  }
}