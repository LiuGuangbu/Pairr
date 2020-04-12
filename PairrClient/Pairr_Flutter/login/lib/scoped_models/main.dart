import 'package:scoped_model/scoped_model.dart';
class global{
  static String _searchValue ="";
  static bool _switchValue=false;
  static String _ThemeValue = "white";
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
}

class MainModel extends Model {
  String _usernumber="";//用户号码
  var _userimage='lib/images/cat.jpg';//用户图像
  var _logonstate=false;//用户状态
  String _username = "昵称名";//用户名字


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