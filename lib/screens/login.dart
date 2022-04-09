import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool login=true;
  TextEditingController forgetEmailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body:login?Column(
        children: [
          Expanded(
            child: Center(
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "parola",
                        icon:Icon(Icons.lock),

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
                  Container(
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

                ],
              ),
            ),
          ),
          Padding(
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
          ),
        ],
      ):Column(
        children: [
          Expanded(
            child: Center(
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

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "isim",
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
                      decoration: InputDecoration(
                        icon:Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "parola",
                      ),
                    ) ,
                  ),
                  SizedBox(height: 30,),
                  Container(
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

                ],
              ),
            ),
          ),
          Padding(
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
        ],
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

}
