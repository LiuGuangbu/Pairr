import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'RecordScreen.dart';
import 'Usercreen.dart';


class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
//  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();
  @override
  void initState(){
    list
      ..add(HomeScreen())
      ..add(RecordScreen())
      ..add(UserScreen());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.home,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                  'Home',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.rate_review,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                  '随记',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.person,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                  '我的',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
          ],
          currentIndex:_currentIndex,
          onTap:(int index){
            setState((){
              _currentIndex= index;
            });
          },
          selectedItemColor: Colors.blue,
//          unselectedItemColor: Colors.grey,
          type:BottomNavigationBarType.fixed
      ),
    );
  }
}