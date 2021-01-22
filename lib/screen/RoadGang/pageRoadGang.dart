import 'package:fyp/screen/MainPage.dart';
import 'package:fyp/screen/RoadGang/listOfLengkap.dart';
import 'package:fyp/screen/RoadGang/listOfPenambaikanSemula.dart';
import 'package:fyp/screen/RoadGang/listTaskFromSupervisor.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/RoadGang/usermanual_roadgang.dart';
import 'package:fyp/service/authRoadGang.dart';
import 'package:google_fonts/google_fonts.dart';

class RoadGangHome extends StatefulWidget {
  @override
  _RoadGangHomeState createState() => _RoadGangHomeState();
}

class _RoadGangHomeState extends State<RoadGangHome> {
  final AuthRoadGang _authRoadGang = new AuthRoadGang();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ROAD GANG",style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor:  Colors.blue[800],
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed:() async{
                await _authRoadGang.signOut();
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => MainPage()));
              })
        ],
      ),
      body:GridView.count(
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          primary: false,
          crossAxisCount: 2,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListTaskFromSupervisor()));
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container( margin: EdgeInsets.only(left: 20),child: Image.asset('assets/listworktask1.png',height: 100, width: 100, color: Colors.black87,)),
                  Column(
                    children: [
                      new Text("SENARAI TUGASAN", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                      new Text("PENYELIA", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfPenambaikanSemula()));
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(margin: EdgeInsets.only(left: 20),child: Image.asset('assets/listcompletedworktask.png',height: 100, width: 100, color: Colors.red[900],)),
                  Column(
                    children: [
                      new Text("SENARAI TUGASAN", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                      new Text("LENGKAP DITOLAK", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfLengkap()));
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(margin: EdgeInsets.only(left: 20),child: Image.asset('assets/listcompletedworktask.png',height: 100, width: 100, color: Colors.green[900],)),
                  Column(
                    children: [
                      new Text("SENARAI TUGASAN", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                      new Text("LENGKAP DITERIMA", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => UserManualRoadGang()));
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/user_manual.png',height: 100, width: 100,),
                  Column(
                    children: [
                      new Text("PANDUAN", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                      new Text("PENGGUNA", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
      ]
     )
      );
  }
}