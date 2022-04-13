
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myquranapp/models/sajda.dart';

Widget SajdaCustomTitle(SajdaAyat sajdaAyat,context,){

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 3.0,
          )
        ]
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(

                alignment:Alignment.center,
                height: 40,
                width: 50,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Text(

                  sajdaAyat.juzNumber.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: sajdaAyat.surahEnglishName,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),

                      ]
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text("${sajdaAyat.revelationType}\n",style: TextStyle(
                color: Colors.black54,
                fontSize: 16

              ),

              ),
            ],
          ),

        ],
      ),
    );
}