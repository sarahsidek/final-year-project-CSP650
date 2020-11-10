
import 'package:flutter/material.dart';
import 'package:fyp/model/Task.dart';

import 'ListTask.dart';



class View extends StatefulWidget {
    final Task task;

   View({Key key, this.task}) : super(key: key);

  @override
  _ViewState createState() => _ViewState(task);

}

class _ViewState extends State<View> {
  Task task;
  _ViewState(Task task){
    this.task = task;
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Maklumat Borang Aduan'),
            backgroundColor: Colors.redAccent,
          ),
          body: Container(
            child: Text(task.noAduan),
          ),

      );
    }
}