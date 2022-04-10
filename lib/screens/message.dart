import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  final Map data;
  const Message({Key key, this.data}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
