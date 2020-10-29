import 'package:fyp/model/NewUser.dart';
import 'package:fyp/service/database.dart';
import 'package:flutter/material.dart';
import 'UpdateSupervisor.dart';

class ListSupervisor extends StatefulWidget {
  final String email;
  final String name;
  final String nophone;
  final String uniqueID;
  final String uid;
  ListSupervisor({this.email, this.name, this.nophone, this.uniqueID, this.uid});
  @override
  _ListSupervisorState createState() => _ListSupervisorState();
}

class _ListSupervisorState extends State<ListSupervisor> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: DatabaseService().getSupervisor(),
          builder: (BuildContext context, AsyncSnapshot<List<NewUser>> snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  NewUser sv = snapshot.data[index];
                  return Card(
                    child: ListTile(
                        title: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 5.0),
                              Container(alignment: Alignment.centerLeft,
                                child: Text(sv.name),
                              ),
                              SizedBox(height: 5.0),
                              Container(alignment: Alignment.centerLeft,
                                child: Text(sv.email),
                              ),
                              SizedBox(height: 5.0),
                              Container(alignment: Alignment.centerLeft,
                                child: Text(sv.nophone),
                              )
                            ],
                          ),
                        ),
                        subtitle: Text(sv.uniqueID),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () async {
                                  await alertDialog(context, sv.uid);
                                }
                            ),
                            IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.black,
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (_) =>
                                          UpdateSupervisor(sv: sv)));
                                }
                            ),
                          ],
                        )
                    ),
                  );
                }
            );
          }),
        );
     }
  Future<bool> alertDialog( BuildContext context, String id) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Attention!'),
            content: Text('Do you want to delete? '),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes', style: TextStyle(color: Colors.red),),
                onPressed: ()  async {
                  DatabaseService().deleteSupervisor(id);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
    }
 }


