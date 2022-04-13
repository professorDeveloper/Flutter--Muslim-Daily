
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myquranapp/screens/JuzScreen.dart';
import 'package:myquranapp/screens/SplashScreen.dart';
import 'package:myquranapp/screens/surah_detail.dart';

import 'constants/Constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        JuzScreen.id:(context)=>JuzScreen(),
        SurahDetail.id:(context)=>SurahDetail()
      },
      debugShowCheckedModeBanner: false,
      title: 'My Quran',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch:Constants.kSwatchColor,
        primaryColor: Constants.kPrimary,
        scaffoldBackgroundColor: Colors.white
      ),
      home:SplashScreen(),
    );
  }
}

