import 'package:flutter/material.dart';

Map materialColor = { // 主副颜色
  'black': {
    "primaryColor": 0xFF000000 ,//黑色
    "accentColor" :0xFFF8F8F8,//白色
    "scaffoldBackgroundColor":0xFFFCFAFA,//页面背景颜色灰色
    "primaryColorLight":0xFF03A9F4,//蓝色  ——选中颜色
  },
  'pink': {
    "primaryColor": 0xFFF44336,//红色
    "accentColor" :0xFFF8F8F8,//白se
    "scaffoldBackgroundColor":0xFFFCFAFA,//页面背景颜色灰色
    "primaryColorLight": 0xFF000000 ,//黑色
  },
  'white':{
    "primaryColor": 0xFFF8F8F8,//白se _应用与主题
    "accentColor" :0xFF000000 ,//黑色 ——未选中颜色
    "scaffoldBackgroundColor":0xFFFCFAFA,//页面背景颜色灰色
    "primaryColorLight":0xFFF44336,//红色  ——选中颜色
  },
  'deepblack': {
    "primaryColor": 0xFF000000 ,//黑色
    "accentColor" :0xFFE7E0E0,//不太白色
    "scaffoldBackgroundColor":0xFF443F3F,//页面背景颜色灰色
    "primaryColorLight":0xFF03A9F4,//蓝色  ——选中颜色
  },
  'blue': {
    "primaryColor": 0xFF1976D2,
    "accentColor" :0xFFd81b60,
    "scaffoldBackgroundColor":0xFFFCFAFA,//页面背景颜色灰色
    "primaryColorLight": 0xFF2196F3,
  },
};

class AppTheme {
  static Map mainColor = materialColor['white'];   // 默认颜色
  static getThemeData(String theme) {  // 获取theme方法： getThemeData();
    mainColor = materialColor[theme];  // 设置主题颜色
    ThemeData themData = ThemeData(
      scaffoldBackgroundColor:Color(mainColor["scaffoldBackgroundColor"]), // 页面的背景颜色
      primaryColor: Color(mainColor["primaryColor"]), // 主颜色
      accentColor:Color(mainColor["accentColor"]),
      primaryColorLight: Color(mainColor["primaryColorLight"]),
      // 按钮颜色
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        textTheme: ButtonTextTheme.normal,
        buttonColor: Color(mainColor["accentColor"]),
      ),
      // 小部件的前景色（旋钮，文本，过度滚动边缘效果等）。
     // accentColor: Color(mainColor["primaryColor"]),

      // appbar样式
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),

      // 图标样式
      iconTheme: IconThemeData(
        color: Color(mainColor["primaryColor"]),
      ),

      // 用于自定义对话框形状的主题。
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 18.0,
          color: Colors.black87,
        ),
      ),
    );
    return themData;
  }
}