import 'package:fyp/model/NewUser.dart';
import 'package:fyp/screen/crud/UpdateRoadGang.dart';
import 'package:fyp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:fyp/shared/Loading.dart';
import 'package:google_fonts/google_fonts.dart';

class ListRoadGang extends StatefulWidget {
  @override
  _ListRoadGangState createState() => _ListRoadGangState();
}

class _ListRoadGangState extends State<ListRoadGang> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: DatabaseService().getRoadGang(),
          builder: (BuildContext context, AsyncSnapshot<List<NewUser>> snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              return Loading();
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    NewUser rg = snapshot.data[index];
                    return Card(
                      child: ListTile(
                          title: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Nama: " , style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      Text(rg.name, style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child:Row(
                                    children: [
                                      Text("Email: " , style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      Text(rg.email, style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Nombor Telefon: " , style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                      Text(rg.nophone, style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Text("Nombor IC: " , style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                              Text(rg.icnumber, style: GoogleFonts.asap(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: ()async{
                                    await alertDialog(context, rg.uid);
                                  }
                              ),
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.black,
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (_) =>
                                            UpdateRoadGang(rg: rg)));
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
            content: Text('Adakah anda mahu menghapuskan?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Ya', style: TextStyle(color: Colors.red),),
                onPressed: ()  async {
                  DatabaseService().deleteRoadGang(id);
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

