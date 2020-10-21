import 'dart:core' as prefix0;
import 'dart:core';
import 'dart:io';

import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class poemsDate {
  String poemname;//名称
  String dynasty;//朝代
  String author;//作者
  String content;//文本
//  String translate;//翻译
//  String appreciation;//注释
  poemsDate(this.poemname,this.dynasty,this.author, this.content,
      //this.translate,this.appreciation
      );
}

class global{
  static String _usernumber="123456";//用户号码
  static var _userimage='lib/images/dabai.jpg';//用户图像
  static bool _logonstate=false;//用户状态
  static String _username = "昵称未设定";//用户名字
  static double _opacity = 1.0;//推荐框的亮度
  //int _count = 0;
  static List _listPoems = [];
  static int _listPoems_length =0;
  static int _searchShow =0;
  static String _searchValue ="";//搜索的内容
  static bool _switchValue=false;//夜间模式的状态
  static String _ThemeValue = "white";//默认的主题颜色
  static String _searchName =  "";//点击搜索诗词名字
  static var _searchContent = "" ;//"好雨知时节，\n当春乃发生。\n 随风潜入夜，\n润物细无声。 \n野径云俱黑，\n江船火独明。\n 晓看红湿处，\n花重锦官城。\n";//点击搜索诗词文本
  static String _searchAuthor= "";//点击搜索诗词作者
  static String _searchTran= "诗词翻译数据加载中。。。";//点击搜索诗词翻译
  static String _searchNote= "诗词注释数据加载中。。。";//点击搜索诗词注释
  static String _searchDynasty= "";//点击搜索诗词朝代
  static File _photopath=null;  //文件路径
  static String  imageBase;    //base64图片文件
  static String _imagepath2;   //文件路径String类型
  static bool _floatingActionButton =true;//键盘打开时，隐藏拍照按钮
  static String _text_Family_Poem;//='HuawenXingkai';   //推荐文本的字体

//  static String _apiUrlphoto="http://192.168.0.103:5050/photo";
//  static String _apiUrlserach="http://192.168.0.103:5050/serach";//搜索
//  static String _apiUrllogin="http://192.168.0.103:5050/login";//登录
//  static String _apiUrlverification="http://192.168.0.103:5050/verification";//验证码
//  static String _apiUrlregister="http://192.168.0.103:5050/register";//注册
//  static String _apiUrlhot_serach="http://192.168.0.103:5050/hot_serach";


  static String _apiUrlphoto="http://39.97.250.70:5000/photo";  //服务器IP   39.97.250.70:5000
  static String _apiUrlserach="http://39.97.250.70:5000/search";//搜索
  static String _apiUrllogin="http://39.97.250.70:5000/login";//登录
  static String _apiUrlverification="http://39.97.250.70:5000/verification";//验证码
  static String _apiUrlregister="http://39.97.250.70:5000/register";//注册
  static String _apiUrlhot_serach="http://39.97.250.70:5000/hot_serach";

  static String get_text_Family_Poem(){
    return _text_Family_Poem;
  }
  static String set_text_Family_Poem(String string){
    _text_Family_Poem =string;
    return _text_Family_Poem;
  }
  static String get_usernumber(){
    return _usernumber;
  }

  static String get_userimage(){
    return _userimage;
  }
  static String set_userimage(String string){
    _userimage =string;
    return _userimage;
  }
  static String set_usernumber(String string){
    _usernumber =string;
    return _usernumber;
  }
  static String get_username(){
    return _username;
  }
  static String set_username(String string){
    _username =string;
    return _username;
  }
  static bool get_Fbutton() {
    return _floatingActionButton;
  }

  static bool set_Fbutton(bool value) {
    _floatingActionButton = value;
    return _floatingActionButton;
  }

  static bool get_logonstate() {
    return _logonstate;
  }

  static bool set_logonstate(bool value) {
    _logonstate = value;
    return _logonstate;
  }
  static int get_searchShow() {
    return _searchShow;
  }

  static int set_searchShow(int value) {
    _searchShow = value;
    return _searchShow;
  }
  static String get_apiUrlphoto(){
    return _apiUrlphoto;
  }
  static String get_apiUrlhot_serach(){
    return _apiUrlhot_serach;
  }
  static String get_apiUrlserach(){
    return _apiUrlserach;
  }
  static String get_apiUrllogin(){
    return _apiUrllogin;
  }
  static String get_apiUrlverification(){
    return _apiUrlverification;
  }
  static String get_apiUrlregister(){
    return _apiUrlregister;
  }

  static String get_imagepath2() {
    return _imagepath2;
  }

    static String set_imagepath2(String value) {
      _imagepath2 = value;
      return _imagepath2;
    }

    static String getimageBase(){
      return imageBase;
    }
    static String setimageBase(String imagebase){
      imageBase=imagebase;
      return imageBase;
    }
    static File get_photopath(){
      return _photopath;
    }
    static File set_photopath(var path){
      _photopath=path;
      return _photopath;
    }
    static getlistPoemlength(){
      return _listPoems_length;
    }
    static setlistPoemslength(int _list){
      _listPoems_length = _list;
      return _listPoems_length;
    }
    static getlistPoems(){
      return _listPoems;
    }
    static setlistPoems(List _list){
      _listPoems = _list;
      return _listPoems;
    }
    static getOpacity()  {
//      final prefs = await SharedPreferences.getInstance();
//      final double pref  = prefs.getDouble('opacity').toDouble() ?? 1.0;
//      _opacity = pref;
      return _opacity;
    }
    static setOpacity(double  opacity) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setDouble('opacity', opacity);
      final double pref  = prefs.getDouble('opacity').toDouble() ?? 1.0;
      _opacity =pref;
     // return _opacity;
    }
    static getSearchName(){
      return _searchName;
    }
    static getSearchContent(){
      return _searchContent;
    }
    static getSearchAuthor(){
      return _searchAuthor;
    }
    static getSearchTran(){
      return _searchTran;
    }
    static getSearchNote(){
      return _searchNote;
    }
    static getSearchDynasty(){
      return _searchDynasty;
    }
    static setSearchV(String search){
      _searchValue = search;
      return _searchValue;
    }
    static getSearchV(){
      return _searchValue;
    }
    static getSwitchV(){
      return _switchValue;
    }
    static setSwitchV(bool _bool){
      _switchValue = _bool;
      return _switchValue;
    }
    static setThemeV( String string){
      _ThemeValue = string;
      return _ThemeValue;
    }
    static getThemeV(){
      return _ThemeValue;
    }
    static setSearchName( String string){
      _searchName = string;
      return _searchName;
    }
    static setSearchContent(String string){
      _searchContent = string;
      return _searchContent;
    }
    static setSearchAuthor(String string){
      _searchAuthor = string;
      return _searchAuthor;
    }
    static setSearchTran(String string){
      _searchTran = string;
      return _searchTran;
    }
    static setSearchNote(String string){
      _searchNote = string;
      return _searchNote;
    }
    static setSearchDynasty(String string){
      _searchDynasty= string;
      return _searchDynasty;
    }
  }


// class MainModel extends Model {
//   String _usernumber="123456";//用户号码
//   var _userimage='lib/images/dabai.jpg';//用户图像
//   var _logonstate=false;//用户状态
//   String _username = "昵称未设定";//用户名字
//
//   double _opacity = 1.0;//推荐框的亮度
//
//   //int _count = 0;
//
//   String get username {
//     return _username;
//   }
//   String get usernumber{
//     return _usernumber;
//   }
//   String get userimage{
//     return _userimage;
//   }
//   bool get logonstate{
//     return _logonstate;
//   }
//  double get opacity {
//     return _opacity;
//   }
// //  bool get switchValue{
// //    return _switchValue;
// //  }
//
// //  int get count {
// //    return _count;
// //  }
//
//   void updateUsername(String username) {
//     _username = username;
//   }
//   void updateUsernumber(String usernumber) {
//     _usernumber = usernumber;
//
//   }
//   void updateLogonstate(var logonstate) {
//     _logonstate = logonstate ;
//
//   }
//   void updateUserimage(var useriamge) {
//     _userimage = useriamge;
//   }
//   undateOpacity(double opacity) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setDouble('opacity', opacity);
//
//     _opacity = opacity;
//   }
//
//
// //  void incrementCount() {
// //    _count += 1;
// //    notifyListeners();
// //  }
// }