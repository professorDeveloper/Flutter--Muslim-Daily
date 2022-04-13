import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:myquranapp/models/aya_of_the_day.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:myquranapp/models/juz.dart';
import 'package:myquranapp/models/qari.dart';
import 'package:myquranapp/models/translation.dart';

import '../models/sajda.dart';
import '../models/surah.dart';

class ApiServices{
  final endPointUrl ="http://api.alquran.cloud/v1/surah";
  List<Surah> list=[];
    int index =0;
  random(min , max){
    var rn =new Random();
    return min+rn.nextInt(max-min);
  }
  Future<AyaOfTheDay> getAyaOfTheDay() async{
    String url="https://quranenc.com/api/translation/aya/uzbek_mansour/2/${random(1, 286)}";
    final response=await http.get(Uri.parse(url));
    
    if (response.statusCode==200) {
      return AyaOfTheDay.fromJSON(json.decode(response.body));
      
    }
    else{
      print('Failed Load ');
      throw Exception("Faild Load !");

    }
  }
  Future<List<Surah>> getSurah() async{
    Response  res=await http.get(Uri.parse(endPointUrl));
    if (res.statusCode==200) {
      Map<String, dynamic> json =jsonDecode(res.body);
      json['data'].forEach((element){
        if (list.length<114)   {
          list.add(Surah.fromJson(element));

        }  
      });
      print('sura uzunligi :${list.length}');
      return list;

    }
    else{
      throw ("Can't get Surah");
    }
   }
   Future<SajdaList> getSajda() async{
    String url="http://api.alquran.cloud/v1/sajda/en.asad";
    final response=await http.get(Uri.parse(url));
    if (response.statusCode==200) {
        return SajdaList.frromJSON(json.decode(response.body) );

    }
    else{
      print('Failed !! :( !');
      throw Exception("Failed to Load Post");
    }
   }
   Future<JuzModel> getJuzz(int index)async{
    String url="http://api.alquran.cloud/v1/juz/$index/quran-uthmani";
    final response=await http.get(Uri.parse(url));
    if (response.statusCode==200) {
      return JuzModel.fromJSON(json.decode(response.body));

    }
    else{
      print('Api services is error');
      throw Exception("Failed api service !");


    }
   }
   Future<SurahTranslationList> getTranslation(int index, int translationIndex)async{
    String lan="";
    if(translationIndex==0){
      lan="uzbek_mansour";
    }
      else if(translationIndex==1){
      lan="turkish_rwwad";
    }
      else if(translationIndex==2){
      lan="english_saheeh";
    }
      else if(translationIndex==3){
      lan="french_montada";
    }
      else if(translationIndex==4){
      lan="spanish_garcia";
    }
      else if(translationIndex==5){
      lan="german_bubenheim";
    }
      else if(translationIndex==6){
      lan="indonesian_complex";
    }
      else if(translationIndex==7){
      lan="uyghur_saleh";
    }
      else if(translationIndex==8){
      lan="tajik_arifi";
    }  else if(translationIndex==9){
      lan="chinese_makin";
    }
    final String url="https://quranenc.com/api/translation/sura/$lan/$index";
    var res=await http.get(Uri.parse(url));
    return SurahTranslationList.fromJson(json.decode(res.body));

   }
   List<Qari> qariList=[];

  Future<List<Qari>> getQariList() async{
    final res= '''
          {"code":200,"status":"OK","data":[{"englishName":"Al-Afasiy","serverNumber":"8","identifier":"afs"},{"englishName":"Al-Toubayti","serverNumber":"6","identifier":"thubti"},{"englishName":"Az-Zahrani","serverNumber":"9","identifier":"zahrani"},{"englishName":"Abdulghani Abdullah","serverNumber":"12","identifier":"malaysia/abdulgani"},{"englishName":"Abdullah Al-Burimi","serverNumber":"8","identifier":"brmi"},{"englishName":"Abdullah Al-Khalaf","serverNumber":"14","identifier":"khalf"},{"englishName":"Abdullah Albuajan","serverNumber":"8","identifier":"buajan"},{"englishName":"Abdullah Qaulan","serverNumber":"8","identifier":"gulan"},{"englishName":"Abdul Aziz Al-Ahmad","serverNumber":"11","identifier":"a_ahmed"},{"englishName":"Abdulbasit Abdulsamad","serverNumber":"7","identifier":"basit"},{"englishName":"Abdulhadi Kanakeri","serverNumber":"6","identifier":"kanakeri"},{"englishName":"Abdullah Abdal - Rewayat","serverNumber":"16","identifier":"a_abdl/Rewayat-Hafs-A-n-Assem"},{"englishName":"Abdullah Al-Johany","serverNumber":"13","identifier":"jhn"},{"englishName":"Abdullah Al-Kandari","serverNumber":"10","identifier":"Abdullahk"},{"englishName":"Abdullah Al-Mattrod","serverNumber":"8","identifier":"mtrod"},{"englishName":"Ahmad Al-Ajmy","serverNumber":"10","identifier":"ajm"},{"englishName":"Adel Ryyan","serverNumber":"8","identifier":"ryan"},{"englishName":"Ahmad Al Nufais","serverNumber":"16","identifier":"nufais/Rewayat-Hafs-A-n-Assem"},{"englishName":"Ahmad Al-Hawashi","serverNumber":"11","identifier":"hawashi"},{"englishName":"Ahmad Deban","serverNumber":"16","identifier":"deban/Rewayat-Hafs-A-n-Assem"},{"englishName":"Bandar Balilah","serverNumber":"6","identifier":"balilah"},{"englishName":"Dawood Hamza","serverNumber":"9","identifier":"hamza"},{"englishName":"Emad Hafez","serverNumber":"6","identifier":"hafz"},{"englishName":"Fawaz Alkabi","serverNumber":"8","identifier":"fawaz"},{"englishName":"Hani Arrifai","serverNumber":"8","identifier":"hani"},{"englishName":"Hussain Alshaik","serverNumber":"11","identifier":"alshaik"},{"englishName":"Hitham Aljadani","serverNumber":"6","identifier":"hafz"},{"englishName":"Hatem Fareed Alwaer","serverNumber":"11","identifier":"hatem"},{"englishName":"Jamal Shaker Abdullah","serverNumber":"6","identifier":"jamal"},{"englishName":"Khalid Algamdi","serverNumber":"6","identifier":"ghamdi"},{"englishName":"Khaled Al-Qahtani","serverNumber":"10","identifier":"qht"},{"englishName":"Mahmoud Khalil Al-Hussary","serverNumber":"13","identifier":"husr"},{"englishName":"Siddiq Al-Minshawi","serverNumber":"10","identifier":"minsh"},{"englishName":"Mustafa Ismail","serverNumber":"8","identifier":"mustafa"},{"englishName":"Mohammed Jibreel","serverNumber":"8","identifier":"jbrl"},{"englishName":"Mohammed Ayyub","serverNumber":"8","identifier":"ayyub"},{"englishName":"Nabil Al Rifay","serverNumber":"9","identifier":"nabil"},{"englishName":"Nasser Alqatami","serverNumber":"6","identifier":"qtm"},{"englishName":"Raad Al Kurdi","serverNumber":"6","identifier":"kurdi"},{"englishName":"Sahl Yassin","serverNumber":"6","identifier":"shl"},{"englishName":"Tawfeeq As-Sayegh","serverNumber":"6","identifier":"twfeeq"},{"englishName":"Wadeea Al-Yamani","serverNumber":"6","identifier":"wdee3"},{"englishName":"Yasser Al-Mazroyee","serverNumber":"9","identifier":"mzroyee"},{"englishName":"Zaki Daghistani","serverNumber":"9","identifier":"zaki"},{"englishName":"Yasser Al-Qurashi","serverNumber":"9","identifier":"qurashi"},{"englishName":"Yasser Al-Qurashi","serverNumber":"9","identifier":"qurashi"},{"englishName":"Yasser Al-Qurashi","serverNumber":"9","identifier":"qurashi"}]}
'''.trim();
      Map<String, dynamic> json = jsonDecode(res);
      json['data'].forEach((element){
        if(qariList.length<=50) {
          qariList.add(Qari.fromJson(element));
        }

      });


    print("Uzunlik qari jon :${qariList.length}");

      return qariList;
    }

  }