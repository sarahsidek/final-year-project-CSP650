import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:fyp/shared/Loading.dart';

class ListTask extends StatefulWidget {
  @override
  _ListTaskState createState() => _ListTaskState();
}


final FirebaseAuth auth = FirebaseAuth.instance;
Stream<QuerySnapshot> getUserRd(BuildContext context) async* {
  final FirebaseUser rd = await auth.currentUser();
  yield* Firestore.instance.collection("Task").where('uid',isEqualTo: rd.uid).snapshots();
}

class _ListTaskState extends State<ListTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: getUserRd(context),
          builder: (context, snapshot){
            if (snapshot.hasError || !snapshot.hasData) {
              return Loading();
            } else{
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index){
                    final ba = snapshot.data.documents[index];
                    return Card(
                        child:ListTile(
                          title: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(ba['sumberAduan']),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(ba['noAduan']),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(ba['kategori']),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(ba['verified']),
                                ),
                              ],
                            ),
                          ),
                        )
                    );
                  });
            }
          }),
    );
  }
}