
import 'package:fyp/screen/crud/listRecordOfficer.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/crud/AddRecordOfficer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeRecordOfficer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue[800],
        title: Text('PEGAWAI MEREKOD',style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 16)),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddRecordOfficer()));
              })
        ],
      ),
      body: ListRecordOfficer(),
    );
  }
}


