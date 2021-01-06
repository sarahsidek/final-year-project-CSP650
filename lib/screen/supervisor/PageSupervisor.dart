import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/MainPage.dart';
import 'package:fyp/service/authSupervisor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fyp/screen/supervisor/ContainerRecordOfficer.dart' as first;
import 'package:fyp/screen/supervisor/ContainerRoadGang.dart' as second;


class Supervisor extends StatefulWidget {


  @override
  _SupervisorState createState() => _SupervisorState();
}

class _SupervisorState extends State<Supervisor> {

  final AuthSupervisor _authSupervisor = AuthSupervisor();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:   Scaffold(
        appBar: AppBar(
          title: Text("Penyelia",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 18,  color: Colors.black87)),
          backgroundColor:  Colors.blue[800],
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.black87,
                ),
                onPressed:() async{
                  await _authSupervisor.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => MainPage()));
                })
          ],
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(0.5),
              color: Colors.blue[800],
            ),
            tabs: [
              Tab(
                child: Text("Pegawai Merekod", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87)),
              ),
              Tab(
                child: Text("Road Gang",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87)),
              )],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
           new first.ContainerRecordOfficer(),
            new second.ContainerRoadGang()
        ],
        ),
      )
    ) ;

  }
}
