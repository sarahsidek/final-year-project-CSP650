import 'package:fyp/model/RecordOfficer.dart';
import 'package:fyp/screen/crud/UpdateRecordOfficer.dart';
import 'package:fyp/service/database.dart';
import 'package:flutter/material.dart';

class ListRecordOfficer extends StatefulWidget {
  @override
  _ListRecordOfficerState createState() => _ListRecordOfficerState();
}

class _ListRecordOfficerState extends State<ListRecordOfficer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: DatabaseService().getRecordOfficer(),
          builder: (BuildContext context, AsyncSnapshot<List<RecordOfficer>> snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    RecordOfficer rd = snapshot.data[index];
                    return Card(
                      child: ListTile(
                          title: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(rd.name),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child:Text(rd.email),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(rd.uniqueID),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Text(rd.pegawaiZon),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () async{
                                   await alertDialog(context, rd.uid);
                                  }
                              ),
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.black,
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (_) =>
                                            UpdateRecordOfficer(rd: rd)));
                                  }
                              ),
                            ],
                          )
                      ),
                    );
                  });
            }
          }),
    );
  }
  Future<bool> alertDialog( BuildContext context, String id) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Perhatian!'),
            content: Text('Adakah anda mahu menghapuskan? '),
            actions: <Widget>[
              FlatButton(
                child: Text('Ya', style: TextStyle(color: Colors.red),),
                onPressed: ()  async {
                  DatabaseService().deleteRecordOfficer(id);
                },
              ),
              FlatButton(
                child: Text("Tidak"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
