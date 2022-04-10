import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sf_messageing/screens/search.dart';
import 'package:sf_messageing/screens/splash.dart';

import '../model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List userList=[];

  @override
  void initState() {
    getUserList();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: drawer(size),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData.fallback(),
        title: Row(children: [
          Image.asset("assets/images/logo.png",height: 50,),
          Text("Mesajlar",style: TextStyle(
            color: Colors.black,
          ),),
        ],),
        actions: [
          IconButton(onPressed: (){
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(userList),
            );
          },icon:Icon(Icons.person_add_alt_1_outlined),),
        ],
      ),
    );
  }

  drawer(Size size) {
    return SafeArea(child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 50,
                backgroundImage:userModel.photo==""||userModel.photo==null?AssetImage("assets/images/profile/1.png"):NetworkImage(userModel.photo),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(userModel.name,style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
            ),
            GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut().then((value) {

                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>SplashScreen()));
                });
              },
              child: Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 10,),
                  Text("Çıkış Yap",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),),

                ],
              ),
            ),
          ],
        ),
      ),
    ],));
  }

  Future<void> getUserList() async {
    userList.clear();
    QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection("users").get();
    List list=querySnapshot.docs;
    for(int i=0;i<list.length;i++){
      if(userModel.name!=list[i]["nick"]){
        userList.add(list[i]["nick"]);
      }
    }
  }
}
