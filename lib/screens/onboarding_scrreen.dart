import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:myquranapp/constants/Constants.dart';
import 'package:myquranapp/screens/main_screen.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Online Read Quran !",
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  child: Text("O`qishingiz uchin endi yanda qulay , bir necha tilda o`qing ,va tinglang !",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
              image: Center(child: Image.asset('assets/foydaliish.gif',fit: BoxFit.fitWidth,))
            ),
            PageViewModel(
              title: "Prayer times !",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("namoz vaqtlarini siz endi aniq bilishingiz mumkin !",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
              image: Center(child: Image.asset('assets/prayertimes.gif'))
            ),
            PageViewModel(
              title: "Foydali ishlar !",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Islomiy odoblar ,islomiy madaniyat va boshqalarni biz bila o`rganing !",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),),
                  ),
                  ],
              ),
              image: Center(child: Image.asset('assets/foyda.gif'))
            ),


          ],

          onSkip: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:(context)=>MainScreen()));
          },
          onDone: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));

            },
          showSkipButton: true,
          showNextButton: true,
          next: const Icon(Icons.arrow_forward,color: Colors.black,),
          done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black)),
          skip: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 20)),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Colors.grey,
              color: Constants.kPrimary,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              )
          ),
        ),
      ),
    );
  }
}
