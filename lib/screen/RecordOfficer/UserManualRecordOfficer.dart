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
               children:[
                 Container(
                   alignment: Alignment.center,
                   child:  Image.asset("assets/1.png", height: 370, width: 260, fit: BoxFit.cover,),
                 ),
                 Container(
                   color: Colors.white70,
                   alignment: Alignment.centerLeft,
                   child: Text(" 1. Sila klik ikon + untuk tambah tugasan kepada road gang ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14)),
                 ),
                 Container(
                  margin: EdgeInsets.only(right: 60),
                   child:Image.asset("assets/2.png", height: 370, width: 250, fit: BoxFit.cover,),
                 ),
                 Container(
                   color: Colors.white70,
                   alignment: Alignment.centerLeft,
                   child: Column(
                     children: [
                       Text(" 2. Sila isi pilih tarikh berdasarkan hari bekerja. Tarikh ini wajib diisi ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                       Text(" 3. Sila isi sumber aduan sama ada SISTEM ADUAN MBPJ, SISTEM ADUAN WAZE atau SISTEM ADUAN UTILITI. Sumber aduan ini wajib diisi ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                       Text(" 4. Sila isi nombor aduan berdasarkan daripada  . Sumber aduan ini wajib diisi ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                     ],
                   ),
                 ),
                 Container(
                   alignment: Alignment.center,
                   child:Image.asset("assets/2(1).png", height: 350, width: 300, fit: BoxFit.cover,),
                 ),
               ],
             )
           ),
         ),
       ),
     );
  }
}
