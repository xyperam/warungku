import 'package:flutter/material.dart';
import 'package:warungku/splashscreen.dart';
// import 'views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //judul
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Daftar',
      theme: ThemeData(),
      home: Splashscreen(),
    );
  }
}
