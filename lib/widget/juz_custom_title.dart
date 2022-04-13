import 'package:flutter/material.dart';
import 'package:myquranapp/models/juz.dart';

class JuzCustomTitle extends StatelessWidget {
  final List<JuzAyahs> list;
  final int index;

  JuzCustomTitle({required this.list, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3.0
            )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(list[index].ayahNumber.toString()),
          Text(list[index].ayahText,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700
          ),textAlign: TextAlign.end,),
          Text(list[index].surahName,textAlign: TextAlign.end,)
        ],
      ),
    );
  }
}
