import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCompleteTask extends StatefulWidget {

  final DocumentSnapshot ra;

  AddCompleteTask({Key key, this.ra}) : super(key: key);

  @override
  _AddCompleteTaskState createState() => _AddCompleteTaskState(ra);
}

class _AddCompleteTaskState extends State<AddCompleteTask> {
  DocumentSnapshot ra;
  _AddCompleteTaskState(DocumentSnapshot ra){
    this.ra = ra;
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
