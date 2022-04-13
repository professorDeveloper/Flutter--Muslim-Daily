import 'package:flutter/material.dart';
import 'package:myquranapp/services/api_service.dart';

import '../models/qari.dart';
import '../widget/qari_custom_title.dart';
import 'audio_surah_screen.dart';
class QariListScreen extends StatefulWidget {
  const QariListScreen({Key? key}) : super(key: key);

  @override
  _QariListScreenState createState() => _QariListScreenState();
}

class _QariListScreenState extends State<QariListScreen> {
  ApiServices apiServices=ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(title: Text("Select Qari ",style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.only(top:15, left: 12,right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:12 ,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1,
                      spreadRadius: 0.0,
                      offset: Offset(0,1),
                    ),
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text("Search"),
                      Spacer(),
                      Icon(Icons.search)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child:FutureBuilder(
                  future: apiServices.getQariList(),
                  builder: (BuildContext context,AsyncSnapshot<List<Qari>> snapshot){
                    if(snapshot.hasError){
                      return  Center(child: Text("Internet error please internet connection !"),);
                    }
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    return ListView.builder(
                      itemCount: 46,
                      itemBuilder:(context, index){
                      return QariCustomTitle(qari:snapshot.data![index],
                          ontap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>
                        AudioSurahScreen(qari:snapshot.data![index])));
                      });
                      }
                    );
                  }
                ) ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
