import 'package:flutter/material.dart';
import 'package:islamic/Home/hadeth/HadethScreen.dart';
import 'package:islamic/Home/home.dart';
import 'package:islamic/Home/quran/SurahScreen.dart';
import 'package:islamic/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic',
      debugShowCheckedModeBanner: false,
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => Home(),
        SurahScreen.routeName: (context) => SurahScreen(),
        HadethScreen.routeName: (context) => HadethScreen(),
      },
      theme: MyTheme.lightMode,
    );
  }
}
