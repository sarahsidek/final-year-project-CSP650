import 'package:flutter/material.dart';
import 'package:fyp/screen/RecordOfficer/loginRecordOfficer.dart';
import 'package:fyp/screen/RoadGang/loginRoadGang.dart';
import 'package:fyp/screen/login.dart';
import 'package:fyp/screen/searchTask.dart';
import 'package:fyp/screen/supervisor/loginSupervisor.dart';
import 'package:google_fonts/google_fonts.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.blue[800]
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black87,
              ),
              onPressed:() async{
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => SearchTask()));
              })
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[800]
            ),
          ),
          Image.asset('assets/mpbj2.png', height: 110, width: 450),
          Container(
            margin: EdgeInsets.only(top: 120,left: 50),
             child:  new Text("Tracing Work Task Mobile Application", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          Container(
            margin: EdgeInsets.only(top: 150),
            child: GridView.count(
              crossAxisSpacing: 15.0,
              primary: false,
              crossAxisCount: 2,
              children: [
              Card(
                margin: EdgeInsets.all(15),
                color: Colors.white38,
                child: Column(
                  children: [
                    SizedBox(height: 15, width: 25,),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Image.asset('assets/admin.png',height: 110, width: 100,),
                          Column(
                            children: [
                              new Text("Admin", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                Card(
                  margin: EdgeInsets.all(15),
                  color: Colors.white38,
                  child: Column(
                    children: [
                      SizedBox(height: 15, width: 25,),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSupervisor()));
                        },
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/supervisor.png',height: 110, width: 100,),
                            Column(
                              children: [
                                new Text("Penyelia", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(15),
                  color: Colors.white38,
                  child: Column(
                    children: [
                      SizedBox(height: 15, width: 25,),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginRecordOfficer()));
                        },
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/recordofficer.png',height: 110, width: 100,),
                            Column(
                              children: [
                                new Text("Peg. Merekod", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(15),
                  color: Colors.white38,
                  child: Column(
                    children: [
                      SizedBox(height: 15, width: 25,),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginRoadGang()));
                        },
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/roadgang.png',height: 110, width: 100,),
                            Column(
                              children: [
                                new Text("Road Gang", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
             ]
            )
          )
        ],
      ),
    );
  }
}
