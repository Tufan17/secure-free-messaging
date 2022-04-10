import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sf_messageing/screens/message.dart';
class CustomSearchDelegate extends SearchDelegate {
  List searchList;
  CustomSearchDelegate(this.searchList,);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear_rounded),
        onPressed: () {
          query = '';
          close(context, null);
        },
      ),
    ];
  }


  @override
  String get searchFieldLabel=>"Ara";

  @override
  Widget buildLeading(BuildContext context) {
    return Icon(Icons.search);
  }

  @override
  Widget buildResults(BuildContext context) {
    var matchQuery = <String>[];
    for (var user in searchList) {
      if (user.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(user);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var matchQuery = <String>[];
    for (var rozet in searchList) {
      if (rozet.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(rozet);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            print('Tıklanılan => $result');
            getUserList(context, result);
          },
          title: Text(result),

        );
      },
    );
  }
  Future<void> getUserList(BuildContext context,String name) async {
    QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection("users").get();
    List list=querySnapshot.docs;
    for(int i=0;i<list.length;i++){
      if(name==list[i]["nick"]){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Message(data:list[i].data())));
      }
    }
  }
}