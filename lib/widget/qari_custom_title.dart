import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myquranapp/models/qari.dart';

class QariCustomTitle extends StatefulWidget {
  const QariCustomTitle({Key? key,required this.qari, required this.ontap}):super (key: key);
  final Qari qari;
  final VoidCallback ontap;

  @override
  State<QariCustomTitle> createState() => _QariCustomTitleState();

}

class _QariCustomTitleState extends State<QariCustomTitle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: 0,
                color: Colors.black54,
                offset: Offset(0,1),
              ),

            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.qari.englishName!,textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
