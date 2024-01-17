import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('用户名'), // 用户名
            accountEmail: Text('用户ID'), // 用户ID
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('C:\\Users\\Lenovo\\Pictures\\Saved Pictures\\v2-02e1f6b1b5c0f8a2f078212635d9dde8_r.jpg'), // 用户头像
              // 如果您需要从网络加载图片，可以使用NetworkImage('url')
            ),
            decoration: BoxDecoration(
              color: Colors.blue, // 抽屉头部背景色
            ),
          ),
          ListTile(
            title: Text('项目 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('项目 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
