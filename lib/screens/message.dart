import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class Message extends StatefulWidget {
  final Map data;
  const Message({Key key, this.data}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  TextEditingController controller=TextEditingController();
  ScrollController controllerListView = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.data["nick"]),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
      stream:FirebaseFirestore.instance.collection("chat").doc(userModel.id).collection("message").doc(widget.data["id"]).collection("messages").orderBy("timeStamp").snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Eror :" + snapshot.hasError.toString()),
          );
        }
        if (snapshot.hasData) {
          Future.delayed(Duration(milliseconds: 100), () {
            controllerListView.animateTo(
                controllerListView.position.maxScrollExtent,
                duration: Duration(milliseconds: 200),
                curve: Curves.linear);
          });
        }
        return !snapshot.hasData
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView(
          controller: controllerListView,
          physics: BouncingScrollPhysics(),
          children: snapshot.data.docs.map((doc) {
            if (userModel == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            try {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment:doc["to"]==userModel.id?Alignment.topRight:Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: doc["to"]==userModel.id?BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomLeft: Radius.circular(10)):BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                      color: Colors.blue[100]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        doc["message"],
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } catch (e) {
              print(e.toString());
            }
          }).toList(),
        );
      },
    ),
          ),
          Column(
            children: [
              Divider(),
              Padding(
                padding:
                EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          controller: controller,
                          textCapitalization: TextCapitalization.sentences,

                          decoration: InputDecoration(
                            hintText: "Mesaj yazın",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=>goMessage(widget.data,controller.text),
                      child: Icon(
                        Icons.send,
                        color: Colors.blue,
                        size: size.height * 0.03,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Future goMessage(Map data,String message)async{
    controller.clear();
    await FirebaseFirestore.instance.collection("chat").doc(userModel.id).collection("message").doc(data["id"]).collection("messages").add(
        {
          "timeStamp":Timestamp.now(),
          "to":userModel.id,
          "from":data["id"],
          "message":message,

        });
    await FirebaseFirestore.instance.collection("chat").doc(userModel.id).collection("textedBy").doc(data["id"]).set(
        {
          "timeStamp":Timestamp.now(),
          "to":userModel.id,
          "from":data["id"],
          "message":message,
          "nick":data["nick"],

        });await FirebaseFirestore.instance.collection("chat").doc(data["id"]).collection("textedBy").doc(userModel.id).set(
        {
          "timeStamp":Timestamp.now(),
          "to":userModel.id,
          "from":data["id"],
          "message":message,
          "nick":userModel.name,
        });
    await FirebaseFirestore.instance.collection("chat").doc(widget.data["id"]).collection("message").doc(userModel.id).collection("messages").add(
        {
          "timeStamp":Timestamp.now(),
          "to":userModel.id,
          "from":data["id"],
          "message":message,

        });

  }
}
