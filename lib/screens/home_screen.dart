import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:myquranapp/models/aya_of_the_day.dart';
import 'package:myquranapp/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ApiServices _apiServices=ApiServices();
  AyaOfTheDay? data;
  void setData()async{
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyUsed", true);

  }

  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      setData();
  }


  @override
  Widget build(BuildContext context) {
    var _size=MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri=HijriCalendar.now();
   var day=DateTime.now();
   var format=DateFormat('EEE , d MMM yyyy');
   var formatted=format.format(day);

   _apiServices.getAyaOfTheDay().then((value) => data=value);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: _size.height*0.30,
              width: double.infinity,   //40% of screen image uzbek:ekranni 40 % egallaydi
              decoration: BoxDecoration(
                image:DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/timeHijri.gif")
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(formatted,style: TextStyle(color: Colors.white,fontSize: 20),),
                  RichText(
                    text: TextSpan(
                        children:<InlineSpan> [
                          WidgetSpan(
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),
                              child: Padding(
                                padding:  EdgeInsets.all(5.0),
                                child: Text("Day: "+_hijri.hDay.toString(),style: TextStyle(fontSize: 20,color: Colors.white,fontStyle: FontStyle.normal),),
                              )
                          ),
                          WidgetSpan(
                            child:Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(" ${_hijri.longMonthName} ",style: TextStyle(fontSize: 20,color: Colors.white,),),
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding:  EdgeInsets.all(5),
                              child: Text("Year: ${_hijri.hYear} Hijri",style: TextStyle(fontSize: 20,color: Colors.white),),
                            ),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsetsDirectional.only(top: 10,bottom: 20),
                child: Column(
                  children: [
                      FutureBuilder<AyaOfTheDay>(
                        future: _apiServices.getAyaOfTheDay(),
                        builder: (context,snapshot){
                            switch(snapshot.connectionState){
                              case ConnectionState.none:
                                return Icon(Icons.sync_problem);
                              case ConnectionState.waiting:
                              case ConnectionState.active:
                                return CircularProgressIndicator();
                                case ConnectionState.done :
                                return   Container(
                                  margin: EdgeInsetsDirectional.all(16),
                                  padding: EdgeInsetsDirectional.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        spreadRadius: 1.2,
                                        offset: Offset(0,1)
                                      )
                                    ]
                                  ),
                                  child: Column(
                                    children: [
                                      Text("Kunning Qur'oni Karimi",
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                      Divider( color: Colors.black,thickness: 0.5),
                                      Text(snapshot.data!.arText!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 23)),
                                      Text(snapshot.data!.enTran!,style:GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w700))),
                                      RichText(
                                        text: TextSpan(
                                          children: <InlineSpan>[
                                            WidgetSpan(
                                              child:Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(snapshot.data!.surNumber!.toString()+"- Oyat"),
                                              ),
                                            ),

                                            WidgetSpan(
                                              child:Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text("Al-Baqara"),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );


                        }

                        },
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
