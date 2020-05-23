import 'package:flutter/material.dart';
import 'package:world_time/views/home_view.dart';
import 'package:world_time/views/konum_sec_view.dart';
import 'package:world_time/views/yukleniyor_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: "/yukleniyor",
      routes: {
        "/": (context) => YukleniyorView(),
        "/home": (context) => HomeView(),
        "/konum": (context) => KonumView(),
        "/yukleniyor": (context) => YukleniyorView()
      },
    );
  }
}
