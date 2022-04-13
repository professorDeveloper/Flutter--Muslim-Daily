import 'package:flutter/material.dart';
import 'package:myquranapp/constants/Constants.dart';
import 'package:myquranapp/services/api_service.dart';
import '../models/juz.dart';
import '../widget/juz_custom_title.dart';
class JuzScreen extends StatelessWidget {
  static const String id='juz_screen';
  ApiServices apiServices=ApiServices();

  JuzScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<JuzModel>(
          future: apiServices.getJuzz(Constants.juzIndex!),
          builder: (context,AsyncSnapshot<JuzModel> snapshot){
            if (snapshot.connectionState==ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }
            else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.juzAyahs.length,
                  itemBuilder: (context,index){
                  return JuzCustomTitle(list:snapshot.data!.juzAyahs,index:index,);
                  }
              );
            }
            else{
             return Center(child: Text("Salo,"),);
            }
          }
        )
      ),
    );
  }
}
