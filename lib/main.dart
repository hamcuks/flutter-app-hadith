import 'package:flutter/material.dart';
import 'package:flutter_hadith_app/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kumpulan Hadith',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xFFF5F5F5)
      ),
      home: HomePage(),
    );
  }
}

