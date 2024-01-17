import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import 'page1.dart'; // 导入页面1
import 'page2.dart'; // 导入页面2
import 'page3.dart'; // 导入页面3
import 'page4.dart'; // 导入页面4

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;//页面当前导航
  final List<Widget> _pages = [Page1(), Page2(), Page3(), Page4()];//定义导航组

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('主页')),//主导航
      body: _pages[_selectedIndex],
      drawer: CustomDrawer(),//左侧窗口
      bottomNavigationBar: BottomNavigationBar(//底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: '业务'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '学校'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {//点击时换页并更新状态
    setState(() {
      _selectedIndex = index;
    });
  }
}