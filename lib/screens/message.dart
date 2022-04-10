import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  final Map data;
  const Message({Key key, this.data}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
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
            child: Text("asd"),
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
                      onTap: () async {
                      },
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
}
