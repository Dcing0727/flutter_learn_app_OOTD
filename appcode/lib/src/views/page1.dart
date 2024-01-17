import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:location/location.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String _weatherData = '获取天气信息中...';
  Location location = new Location();

  @override
  void initState() {
    super.initState();
    _getLocationWeather();
  }

  Future<void> _getLocationWeather() async {
    // 获取当前位置
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
      final double lat = currentLocation.latitude!;
      final double lon = currentLocation.longitude!;

      // 使用位置信息请求天气数据
      final apiKey = 'd6487844a54c47f2af63b14926740cbe'; // 替换成您的API密钥
      final requestUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';

      final response = await http.get(Uri.parse(requestUrl));

      if (response.statusCode == 200) {
        setState(() {
          _weatherData = json.decode(response.body).toString();
        });
      } else {
        setState(() {
          _weatherData = '获取天气信息失败';
        });
      }
    } catch (e) {
      setState(() {
        _weatherData = '获取位置或天气信息时发生错误: $e';
        print(_weatherData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_weatherData),
      ),
    );
  }
}
