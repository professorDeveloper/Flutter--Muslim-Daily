import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myquranapp/constants/Constants.dart';
import 'package:myquranapp/screens/audio_screen.dart';
import 'package:myquranapp/screens/home_screen.dart';
import 'package:myquranapp/screens/prayer_screen.dart';
import 'package:myquranapp/screens/quran_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectIndex=0;
  List<Widget> _widgetList=[HomeScreen(),QuranScreen(),QariListScreen(),PrayerScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: _widgetList[selectIndex],
            bottomNavigationBar: ConvexAppBar(
                items: [
          TabItem(icon: Image.asset('assets/house.png',), title: 'Home'),
          TabItem(icon: Image.asset('assets/quranyapp.png',), title: 'Quran'),
          TabItem(icon: Image.asset('assets/audio.png',), title: 'Audio'),
          TabItem(icon:Image.asset('assets/prayeer.png',color: Colors.white,), title: 'Prayer'),
        ],
                initialActiveIndex: 0, //optional, default as 0
                onTap: updateIndex,
              backgroundColor: Constants.kPrimary01,
              activeColor: Constants.kPrimary01,
            ),
        )
    );
  }

  void updateIndex(index){
    setState(() {
       selectIndex=index;

    });
  }
}
