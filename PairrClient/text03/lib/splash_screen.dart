import 'package:flutter/material.dart';
import 'main.dart';
//import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;

  void initState() { 
    super.initState();
    _controller = AnimationController(vsync:this,duration:Duration(milliseconds:6000));
    _animation = Tween(begin: 0.0,end:1.0).animate(_controller);


    /*动画事件监听器，
    它可以监听到动画的执行状态，
    我们这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 */
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context)=>FirstScreen()), 
          (route)=> route==null);
      }
    });
    //播放动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FadeTransition( //透明度动画组件
      opacity: _animation,  //执行动画
      child: Image.network(  //网络图片
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1574059423402&di=a275a74f5d27232a0b6c2519ff3b845a&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20171004%2F01f202a2e3fc4bf292fa2a13dfafe142.jpeg',
        scale: 2.0,  //进行缩放
        fit:BoxFit.cover  // 充满父容器
      ),
    );
  }
}