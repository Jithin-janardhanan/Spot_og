import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Adminvendor extends StatefulWidget {
  Adminvendor({super.key});

  @override
  State<Adminvendor> createState() => _AdminvendorState();
}

class _AdminvendorState extends State<Adminvendor> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference vendorreg =
        FirebaseFirestore.instance.collection('vendor_reg');

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Spot',
            style: TextStyle(color: Colors.amber),
          ),
        ),
        body: StreamBuilder(
            stream: vendorreg.snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot nameSnap = snapshot.data.docs[index];
                    return Text(nameSnap['name']);
                  },
                );
              }
              return Container();
            }));
  }
}
