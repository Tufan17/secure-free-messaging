import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sf_messageing/screens/splash.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  List useerList=[];
  bool login=true;
  bool isUserName=true;
  TextEditingController forgetEmailController=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserNameList();
  }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/25332.jpg"),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
          child:login?loginScreen(size):
      registerScreen(size)),
      bottomNavigationBar:   login?   Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Hesabınız yok mu hemen ",style: TextStyle(
              color: Colors.black38,
            ),),
            GestureDetector(
              onTap: (){
                setState(() {
                  login=false;
                });
              },
              child: Text("kayıt ol",style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),),
            ),
            Text("...",style: TextStyle(
              color: Colors.black38,
            ),),
          ],
        ),
      ):   Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Hesabınız var mı hemen ",style: TextStyle(
              color: Colors.black38,
            ),),
            GestureDetector(
              onTap: (){
                setState(() {
                  login=true;
                });
              },
              child: Text("giriş yap",style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),),
            ),
            Text("...",style: TextStyle(
              color: Colors.black38,
            ),),
          ],
        ),
      ),
    );
  }

  forgetPwd(Size size) {
    showModalBottomSheet(
        isScrollControlled: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        backgroundColor: Colors.blue[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        builder: (BuildContext bc) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Şifreyi Yenile",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20.0,
                          right: size.width * 0.15,
                          left: size.width * 0.15),
                      child: Text(
                        "Hesabınız ilişkili e-posta adresini girin",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.1, right: size.width * 0.1),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: forgetEmailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "e-mail",
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.mail,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.1, right: size.width * 0.1),
                      child: GestureDetector(
                        onTap: (){

                        },

                        child: Container(
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Gönder",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  TextEditingController controllerPassword=TextEditingController();
  TextEditingController controllerMail=TextEditingController();
  bool see=true;
  loginScreen(Size size) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text("Giriş",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),),
          ),
          SizedBox(height: size.height*0.05,),
          Container(
            width: size.width*0.8,
            height: size.height*0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1,color: Colors.black),
            ),
            padding: EdgeInsets.only(left: 5),

            child:TextField(
              controller: controllerMail,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "mail",
                icon:Icon(Icons.person),

              ),
            ) ,
          ),
          SizedBox(height: size.height*0.02,),
          Container(
            width: size.width*0.8,
            height: size.height*0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1,color: Colors.black),
            ),
            padding: EdgeInsets.only(left: 5),
            child:TextField(
              obscureText: see,
              controller: controllerPassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "parola",
                icon:Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      see = !see;
                    });
                  },
                  icon: Icon(
                    see?Icons.visibility_off: Icons.visibility ,
                    color: see?Colors.grey:Colors.blue,
                  ),
                ),
              ),) ,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: size.width*0.1,top: 10),
              child: GestureDetector(
                onTap: ()=>forgetPwd(size),
                child: Text("Şifreni mi unuttun ?",style: TextStyle(
                  color: Colors.black38,
                ),),
              ),
            ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: ()=>onPressedSignIn(controllerMail, controllerPassword),
            child: Container(
              width: size.width*0.3,
              height: size.height*0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              alignment: Alignment.center,
              child:Text("Giriş yap",style: TextStyle(
                color: Colors.white,

              ),),
            ),
          ),

        ],
      ),
    );
  }

  TextEditingController controllerName=TextEditingController();
  TextEditingController controllerRegisterMail=TextEditingController();
  TextEditingController controllerRegisterPassword=TextEditingController();
  bool see1=true;
  registerScreen(Size size) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text("Kayıt Ol",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),),
          ),
          SizedBox(height: size.height*0.05,),
          Container(
            width: size.width*0.8,
            height: size.height*0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1,color: Colors.black),
            ),
            padding: EdgeInsets.only(left: 5),
            child:TextField(
              onChanged: (value){
                setState(() {
                  userName(value.toString());
                });
                },
              controller: controllerName,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "isim",
                icon:Icon(Icons.person),
              ),
            ) ,
          ),
          isUserName?SizedBox():Padding(
            padding: EdgeInsets.only(right: size.width*0.1,top: 5),
            child: Align(
              alignment: Alignment.topRight,
              child: Text("bu isim kullanılıyor",style: TextStyle(
                color: Colors.red,
              ),),
            ),
          ),
          SizedBox(height: size.height*0.02,),
          Container(
            width: size.width*0.8,
            height: size.height*0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1,color: Colors.black),
            ),
            padding: EdgeInsets.only(left: 5),

            child:TextField(
              controller: controllerRegisterMail,

              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "mail",
                icon:Icon(Icons.mail),
              ),
            ) ,
          ),
          SizedBox(height: size.height*0.02,),
          Container(
            width: size.width*0.8,
            height: size.height*0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1,color: Colors.black),
            ),
            padding: EdgeInsets.only(left: 5),
            child:TextField(
              controller: controllerRegisterPassword,
              obscureText: see1,
              decoration: InputDecoration(
                icon:Icon(Icons.lock),
                border: InputBorder.none,
                hintText: "parola",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      see1 = !see1;
                    });
                  },
                  icon: Icon(
                    see1?Icons.visibility_off: Icons.visibility ,
                    color: see1?Colors.grey:Colors.blue,
                  ),
                ),
              ),
            ) ,
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: ()=>onPressedSignUp(),
            child: Container(
              width: size.width*0.3,
              height: size.height*0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              alignment: Alignment.center,
              child:Text("Kayıt ol",style: TextStyle(
                color: Colors.white,

              ),),
            ),
          ),

        ],
      ),
    );
  }

  onPressedSignUp() async {
    if (isUserName==false||controllerRegisterPassword.text.isEmpty ||
        controllerRegisterMail.text.isEmpty ||
        controllerName.text.isEmpty ) {
      showSnackBar(isUserName?"Lütfen boş alanları doldurun":"Geçerli bir isim giriniz");
    } else {


        try {

           await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: controllerRegisterMail.text.toString(),
              password: controllerRegisterPassword.text.toString(),
          );
           User user=FirebaseAuth.instance.currentUser;

           await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
             "nick":controllerName.text,
             "id":user.uid,
             "pp":"",
           });
           onPressedSignIn(controllerRegisterMail, controllerRegisterPassword);

        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            showSnackBar("Sağlanan şifre çok zayıf.");
          } else if (e.code == 'email-already-in-use') {
            showSnackBar("Bu e-posta için hesap zaten var.");
          }
        } catch (e) {
          print(e);
        }


  }
  }

  onPressedSignIn(TextEditingController controller,TextEditingController controller1) async {
    if (controller.text.isEmpty ||
        controller1.text.isEmpty  ) {
      showSnackBar("Lütfen boş alanları doldurun");
    } else {


      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: controller.text,
            password: controller1.text,
        );

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showSnackBar("Bu e-posta için kullanıcı bulunamadı.");
        } else if (e.code == 'wrong-password') {
          showSnackBar("Bu kullanıcı için yanlış parola sağlandı.");
        }
      }


  }
  }

  void showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


   getUserNameList() async {
   useerList.clear();
    QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection("users").get();
    List list=querySnapshot.docs;
    for(int i=0;i<list.length;i++){
      useerList.add(list[i]["nick"]);
  }
  }
  userName(name){
    print(useerList);
    for(int i=0;i<useerList.length;i++){
      print("*");
      if(useerList[i]==name){
        setState(() {
          isUserName=false;
        });
        return ;

      }

    }
    setState(() {
      isUserName=true;
    });
    return ;
  }

}
