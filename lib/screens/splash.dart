import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sf_messageing/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
Future.delayed(Duration(seconds: 3),(){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
});
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
    body:Center(
      child:SizedBox(
          height: size.height*0.5,
          child: Lottie.asset("assets/animation/lf30_editor_9zueahck.json",repeat: false)),),
    );
  }
}