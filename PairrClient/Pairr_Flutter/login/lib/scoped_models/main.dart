import 'package:scoped_model/scoped_model.dart';
class global{
  static String _searchValue ="";//搜索的内容
  static bool _switchValue=false;//夜间模式的状态
  static String _ThemeValue = "white";//默认的主题颜色
  static String _searchName =  "无名";//点击搜索诗词名字
  static String _searchContent = "诗词文本数据加载中。。。";//点击搜索诗词文本
  static String _searchAuthor= "佚名";//点击搜索诗词作者
  static String _searchTran= "诗词翻译数据加载中。。。";//点击搜索诗词翻译
  static String _searchNote= "诗词注释数据加载中。。。";//点击搜索诗词注释
  static String _searchYear= "当代";//点击搜索诗词朝代
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
  static getSearchYear(){
    return _searchYear;
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
  static stSearchYear(String string){
    _searchYear = string;
    return _searchYear;
  }
}

class MainModel extends Model {
  String _usernumber="";//用户号码
  var _userimage='lib/images/dabai.jpg';//用户图像
  var _logonstate=false;//用户状态
  String _username = "李大白";//用户名字


  //int _count = 0;

  String get username {
    return _username;
  }
  String get usernumber{
    return _usernumber;
  }
  String get userimage{
    return _userimage;
  }
  bool get logonstate{
    return _logonstate;
  }
//  bool get switchValue{
//    return _switchValue;
//  }

//  int get count {
//    return _count;
//  }

  void updateUsername(String username) {
    _username = username;
  }
  void updateUsernumber(String usernumber) {
    _usernumber = usernumber;

  }
  void updateLogonstate(var logonstate) {
    _logonstate = logonstate ;

  }
//  void updateSwitchValue(var switchValue) {
//    _switchValue = switchValue ;
//
//  }
  void updateUserimage(var useriamge) {
    _userimage = useriamge;
  }


//  void incrementCount() {
//    _count += 1;
//    notifyListeners();
//  }
}