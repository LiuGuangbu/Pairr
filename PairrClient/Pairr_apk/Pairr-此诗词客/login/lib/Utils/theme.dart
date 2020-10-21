import 'package:flutter/material.dart';

Map materialColor = { // 主副颜色
  'black': {
    "primaryColor": 0xFF000000 ,//黑色
    "accentColor" :0xFFF8F8F8,//白色
    "scaffoldBackgroundColor":0xFFFCFAFA,//页面背景颜色灰色
    "primaryColorLight":0xFF03A9F4,//蓝色  ——选中颜色
    "dividerColor":0xffe5e5e5,//浅灰白
    "cardColor":0xFFDCDCDC,
  },
  'pink': {
    "primaryColor": 0xFFF44336,//红色
    "accentColor" :0xFFF8F8F8,//白se
    "scaffoldBackgroundColor":0xFFFCFAFA,//页面背景颜色灰色
    "primaryColorLight": 0xFF000000 ,//黑色
    "dividerColor":0xffe5e5e5,//浅灰白
    "cardColor":0xFFDCDCDC,
  },
  'white':{
    "primaryColor":0xFFFFFFFF,// 0xFFF8F8F8,//白se _应用与主题
    "accentColor" :0xFF000000 ,//黑色 ——未选中颜色
    "scaffoldBackgroundColor":0xFFF5F5F5,//页面背景颜色
    "primaryColorLight":0xFFF44336,//红色  ——选中颜色
    "dividerColor":0xFFDCDCDC,//亮灰白
    "cardColor":0xFFFFFFFF,//0xFF817F7F,//深灰色
    "dialogBackgroundColor":0xFFDCDCDC,//对话框背景颜色
  },
  'deepblack': {
    "primaryColor":0xFF555352,//灰色
    "accentColor" :0xFFE7E0E0,//不太白色
    "scaffoldBackgroundColor":0xFF3A3737,//0xFF000000 ,//黑色页面背景颜色
    "primaryColorLight":0xFF03A9F4,//蓝色  ——选中颜色
    "dividerColor":0xFF555352,
    "cardColor":0xFFDCDCDC,
    "dialogBackgroundColor":0xFF817F7F,//对话框背景颜色
  },
  'blue': {
    "primaryColor": 0xFF1976D2,
    "accentColor" :0xFFd81b60,
    "scaffoldBackgroundColor":0xFFFCFAFA,//页面背景颜色灰色
    "primaryColorLight": 0xFF2196F3,
    "dividerColor":0xffe5e5e5,//浅灰白
    "cardColor":0xFFDCDCDC,
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
      dividerColor: Color(mainColor["dividerColor"]),
      primaryColorLight: Color(mainColor["primaryColorLight"]),
      cardColor :Color(mainColor["cardColor"]),
      dialogBackgroundColor: Color(mainColor["dialogBackgroundColor"]),

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