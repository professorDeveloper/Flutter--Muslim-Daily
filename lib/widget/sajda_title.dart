import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/surah.dart';
Widget SurahCustomListTitle({
  required Surah surah,
  required BuildContext context,
  required VoidCallback ontap})
{

  return GestureDetector(
    onTap: ontap,
    child: Container(

      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 40,
                width: 50,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black
                ),
                child: Text(surah.number.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(""+surah.englishName! ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                  Text(""+surah.englishNameTranslation! ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black54),),

                ],
              ),
              Spacer(),
              Text(surah.revelationType!, style: TextStyle(color: Colors.black54  ,
                  fontSize: 18),),
            ],
          ),
        ],
      ),
    ),
  );
}