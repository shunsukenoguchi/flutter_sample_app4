import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter App'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return new ListTile(
                title: Text(document.data()['user']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}