import 'package:flutter/material.dart';
import 'package:login/Utils/LocalStorage.dart';
import 'package:login/scoped_models/main.dart';
import 'package:provide/provide.dart';
export 'package:provide/provide.dart';  // 暴露Provider方法,不写此句也可在其他页面再次import


class ConfigProvide with ChangeNotifier {
  var parentContext; // 接受Provider所传的context
    increment(context) {  // provider的model
    parentContext = context;
    notifyListeners();
  }

// 主题
  String theme = 'white';
  Future $getTheme() async {
    String _theme = await LocalStorage.get('theme');
    print('++++++++++++++++++++');

    if (global.getThemeV()=='deepblack'){
      global.setSwitchV(true);
      global.setOpacity(0.7);
    }

    print(_theme);
    if (_theme != null) {
      $setTheme(_theme);
    }
  }

  Future $setTheme(payload) async {
    theme = payload;
    print(theme);
    global.setThemeV(theme);
    LocalStorage.set('theme', payload);
    notifyListeners();
  }
}

final providers = Providers()   //将ConfigProvide对象添加进providers
  ..provide(Provider<ConfigProvide>.value(ConfigProvide()));