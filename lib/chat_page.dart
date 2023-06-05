import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  CollectionReference chats = FirebaseFirestore.instance.collection('chats');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Echo Chat'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          OutlinedButton(
            onPressed: addData,
            child: const Text("Create DB", style: TextStyle(color: Colors.black),),
          ),
        ],
      ),
    );
  }

  Future<void> addData() async {
    try{
      chats
          .add({
            'full_name': "Ashutosh Gupta", // John Doe
            'company': "Unthinkable", // Stokes and Sons
            'age': 21 // 42
          })
          .then((value) => print("User Added"));
    }
    catch(e,s){
      debugPrintStack(label: e.toString(), stackTrace: s);
    }
  }
}

// Person1 - https://res.cloudinary.com/theash/image/upload/v1685953592/codepen/person1_hpzefx.jpg
// Person2 - https://res.cloudinary.com/theash/image/upload/v1685953603/codepen/person2_tpvsyh.png
