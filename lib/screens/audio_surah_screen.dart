import 'package:flutter/material.dart';
import 'package:myquranapp/constants/Constants.dart';
import 'package:myquranapp/models/qari.dart';
import 'package:myquranapp/services/api_service.dart';

import '../models/surah.dart';
import 'audio_quran_screen.dart';
class AudioSurahScreen extends StatefulWidget {
  final Qari qari;
  const AudioSurahScreen({Key? key,required this.qari}) : super(key: key);

  @override
  State<AudioSurahScreen> createState() => _AudioSurahScreenState();
}

class _AudioSurahScreenState extends State<AudioSurahScreen> {
  ApiServices apiServices=ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.kPrimary,
          elevation: 0,
          title: Text("Surah List",
          style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20),),

        ),
        body: FutureBuilder(
            future: apiServices.getSurah(),
            builder: (BuildContext context,
            AsyncSnapshot<List<Surah>> snapshot) {
              if(snapshot.hasData){
                List<Surah>? surah=snapshot.data;
                return ListView.builder(
                  itemCount: surah!.length,
                    itemBuilder:(context,index) =>
                AudioTile(surahName:snapshot.data![index].englishName,
                totalAya:snapshot.data![index].numberOfAyahs,
                number: snapshot.data![index].number,
                    onTap:(){
                  Navigator.push(context, MaterialPageRoute(
                    builder:(context)=> AudioScreen(
                      qari:widget.qari,
                      index:index+1,
                      list: surah
                    )
                  ));
                })
                );
              }
              return Center(child: CircularProgressIndicator(),
              );
        }
          ),
        ),
    );
  }
  Widget AudioTile({required String? surahName,required totalAya,required number, required VoidCallback onTap}){

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const   EdgeInsets.all(4),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 0,
                color: Colors.black54,
                offset: Offset(0,3)

              ),
            ]
          ),
          child:Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 50  ,
                width: 60,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPrimary
                ),
                child: Text((number).toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(surahName!,
                  textAlign: TextAlign.end,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),),
                  SizedBox(height: 3,),
                  Text("Total aya "+totalAya.toString(),style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18
                  ),)

                ],
              ),
              Spacer(),
              Icon(Icons.play_circle_fill,color: Constants.kPrimary,)
            ],
          ),
        ),
      ),
    );
  }
}
