import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class UserManualRecordOfficer extends StatefulWidget {
  @override
  _UserManualRecordOfficerState createState() => _UserManualRecordOfficerState();
}

class _UserManualRecordOfficerState extends State<UserManualRecordOfficer> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("PANDUAN PENGGUNA ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14)), backgroundColor: Colors.blue[800],
       ),
       body: Form(
         child: SingleChildScrollView(
           child: Container(
             child: Column(
               children: [

               ],
             )
           ),
         ),
       ),
     );
  }
}
