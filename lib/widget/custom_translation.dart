import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myquranapp/constants/Constants.dart';
import 'package:myquranapp/models/translation.dart';

class TranslationTitle extends StatelessWidget {
  final int index;
  final SurahTranslation surahTranslation;

  TranslationTitle({required this.index, required this.surahTranslation});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
            blurRadius: 1
        ),

            ]
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                ),
                padding: EdgeInsets.all(30),
                width: double.infinity ,
              ),
              Positioned(
                top:  3,
                left: 11,
                child: Container(
                  padding: EdgeInsets.all(17),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black

                  ),
                  child: Text(surahTranslation.aya!,
                    textAlign: TextAlign.center,style:
                    TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,

                    ),),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(surahTranslation.arabic_text!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                  ),
                ),
               Text(surahTranslation.translation!,
                    textAlign: TextAlign.start,
                    style:GoogleFonts.roboto(color: Colors.black,fontSize: 23,fontWeight: FontWeight.w600) ),


              ],
            ),
          )
        ],
      ),
      ),
    );
  }
}
