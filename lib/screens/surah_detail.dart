import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myquranapp/constants/Constants.dart';
import 'package:myquranapp/services/api_service.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../models/translation.dart';
import '../widget/custom_translation.dart';

enum Translation{uzbek,turkey,engilish,french_montada,spanish_garcia,germa,indonesian,uygu,tajik,chinese_makin}

class SurahDetail extends StatefulWidget {
  const SurahDetail({Key? key}) : super(key: key);
  static const String id='surahDetail_screen';

  @override
  _SurahDetailState createState() => _SurahDetailState();
}

class _SurahDetailState extends State<SurahDetail> {
  ApiServices _apiServices=ApiServices();
  Translation? _translation=Translation.uzbek;

     @override
  Widget build(BuildContext context) {
    return SafeArea(
      child : Scaffold(
        body: FutureBuilder(
        future: _apiServices.getTranslation(Constants.surahIndex!,_translation!.index),
        builder: (BuildContext context, AsyncSnapshot<SurahTranslationList> snapshot){
          if (snapshot.connectionState==ConnectionState.waiting)   {
            return Center(child: CircularProgressIndicator(),);
          }
          else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child :
                ListView.builder(
                itemCount: snapshot.data!.translationList.length,
                itemBuilder: (context,index){
                  return TranslationTitle(index: index,
                  surahTranslation: snapshot.data!.translationList[index],);
                },
              ),
              );

          }
          else return Center(child: Text("Translation not found"),);
        },
      ),
        bottomSheet: SolidBottomSheet(
          headerBar: Container(
            color: Theme.of(context).primaryColor,
            height: 50 ,
            child: Center(
              child: Text("Selected Translation Iltimos tepaga ko`taring ! ",
              style: TextStyle(color: Colors.white),),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: 30 ,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text("Uzbek"),
                      leading: Radio<Translation>(
                        value: Translation.uzbek,
                        groupValue: _translation,
                        onChanged: (Translation? value){
                          setState(() {
                            _translation=value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Turkish "),
                      leading: Radio<Translation>(
                        value: Translation.turkey,
                        groupValue: _translation,
                        onChanged: (Translation? value){
                          setState(() {
                            _translation=value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("English"),
                      leading: Radio<Translation>(
                        value: Translation.engilish,
                        groupValue: _translation,
                        onChanged: (Translation? value){
                          setState(() {
                            _translation=value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("France "),
                      leading: Radio<Translation>(
                        value: Translation.french_montada,
                        groupValue: _translation,
                        onChanged: (Translation? value){
                          setState(() {
                            _translation=value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Ispaniya "),
                      leading: Radio<Translation>(
                        value: Translation.spanish_garcia,
                        groupValue: _translation,
                        onChanged: (Translation? value){
                          setState(() {
                            _translation=value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Germanya "),
                      leading: Radio<Translation>(
                        value: Translation.germa,
                        groupValue: _translation,
                        onChanged: (Translation? value){
                          setState(() {
                            _translation=value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Indonesia "),
                      leading: Radio<Translation>(
                        value: Translation.indonesian,
                        groupValue: _translation,
                        onChanged: (Translation? value){
                          setState(() {
                            _translation=value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Uygur"),
                      leading: Radio<Translation>(
                        value: Translation.uygu,
                        groupValue: _translation,
                        onChanged: (Translation? value){
                          setState(() {
                            _translation=value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Tajik"),
                      leading: Radio<Translation>(
                        value: Translation.tajik,
                        groupValue: _translation,
                        onChanged: (Translation? value){
                          setState(() {
                            _translation=value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Hitoy"),
                      leading: Radio<Translation>(
                        value: Translation.chinese_makin,
                        groupValue: _translation,
                        onChanged: (Translation? value){
                          setState(() {
                            _translation=value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
