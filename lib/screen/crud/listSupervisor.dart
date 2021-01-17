import 'package:fyp/model/Supervisor.dart';
import 'package:fyp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';
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
          builder: (BuildContext context, AsyncSnapshot<List<Supervisor>> snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return Loading();
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Supervisor sv = snapshot.data[index];
                  return Card(
                    color: Colors.grey[400],
                    margin: EdgeInsets.only(left: 5.0,right: 5.0, top: 5.0,bottom: 5.0),
                    child: ListTile(
                        title: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 5.0),
                              Container(alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("NAMA: " , style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                    Text(sv.name, style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Container(alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("E-MEL: " , style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                    Text(sv.email, style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Container(alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("NOMBOR TELEFON: " , style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                    Text(sv.nophone, style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Container(alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("NOMBOR KAD PENGENALAN:" , style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Container(alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text(sv.icnumber, style: GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 15)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
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
            title: Text('PERHATIAN!'),
            content: Text('ADAKAH ANDA MAHU MENGHAPUSKAN? '),
            actions: <Widget>[
              FlatButton(
                child: Text('YA', style: TextStyle(color: Colors.red),),
                onPressed: ()  async {
                  DatabaseService().deleteSupervisor(id);
                },
              ),
              FlatButton(
                child: Text("TIDAK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
    }
 }


