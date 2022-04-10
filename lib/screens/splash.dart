import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sf_messageing/model/user_model.dart';
import 'package:sf_messageing/screens/home.dart';
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
  FirebaseAuth.instance
      .userChanges()
      .listen((User user) {
    if (user == null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    } else {
      userGet(user).then((value) =>       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())));

    }
  });
});
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body:Center(
      child:SizedBox(
          height: size.height*0.5,
          child: Lottie.asset("assets/animation/lf30_editor_9zueahck.json",repeat: false)),),
    );
  }
  Future userGet(User user) async {
    DocumentSnapshot snapshot=await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
    Map map=snapshot.data();

    userModel = UserModel.fromMap(map);
  }


}