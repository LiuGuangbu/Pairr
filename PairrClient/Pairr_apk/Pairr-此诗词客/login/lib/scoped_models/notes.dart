//创建一个推荐诗词库类型
import 'package:shared_preferences/shared_preferences.dart';
class Notesdata{
  String title;
  String content;
  String part;
  Notesdata(this.title,this.content,this.part);
  Notesdata.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        part =json['part'];

  Map<String, dynamic> toJson() =>
      {
        'title': title,
        'content': content,
        'part':part,
      };
}

class Notes{
  static String title;
  static String content;
  static String part;
  static DateTime nowtime;
  static List notes ;
  static setnotes(List list){
    notes=list;
    return notes;
  }
  static  setNowtime(DateTime dateTime){
     nowtime = dateTime ;
  }
  static getNowtime(){
    return nowtime;

  }
  static  setPart(String string){
    part = string;
  }
  static getPart(){
    return part;

  }
  static  setTitle(String Stitle)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title', Stitle);
    title =Stitle;
    print('title的值是：${prefs.getString('title')}');
  }

  static getTitle() {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    //判断是否有值
//    if(prefs.getString('title')!=null){
//      title=prefs.getString('title')as String;
//    }
//    else
//      title=null;
//    print('访问title的值是：${prefs.getString('content')}');
    return title;
  }
  static  setContent(String string)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('content', string);
    content = string;
    print('content的值是：${prefs.getString('content')}');
  }
  static  getContent() {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    //判断是否有值
//    if(prefs.getString('content')!=null){
//      content=prefs.getString('content')as String;
//    }
//    else
//      content=null;
//    print('访问content的值是：${prefs.getString('content')}');
    return content;
  }
  static Future<String>  setNotes(List list)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('notes', list);
    print('notes的值是：${prefs.getStringList('notes')}');
  }
   static Future<List> getNotes() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //判断是否有值
    if(prefs.getStringList('notes')!=null){
      setNotes(prefs.getStringList('notes'));
    }
    else
      notes=null;
    print('notes的值是：$notes');
    return notes;
  }


}
