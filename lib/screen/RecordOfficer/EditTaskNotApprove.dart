import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditTask extends StatefulWidget {
 final DocumentSnapshot da;

  const EditTask({Key key, this.da}) : super(key: key);

  @override
  _EditTaskState createState() => _EditTaskState(da);
}

class _EditTaskState extends State<EditTask> {
  DocumentSnapshot da;
  _EditTaskState(DocumentSnapshot da){
    this.da = da;
  }
 TextEditingController _noAduan;
 TextEditingController _sumberAduan;
 TextEditingController _kategori;

 @override
 void initState(){
   super.initState();
   _noAduan = TextEditingController(text: widget.da.data['noAduan']);

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kemaskini Maklumat Penyelia"),
          backgroundColor: Colors.redAccent,
        ),
    body: Container(
      child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 10.0),
              TextField(
                decoration:InputDecoration(
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5))),
                controller: _noAduan,
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              )
            ],
          ),
      ),
    )
    );
  }
}



