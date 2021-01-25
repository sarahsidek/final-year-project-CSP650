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
                 SizedBox(child: Image.asset("assets/1.png", height: 380, width: 280, fit: BoxFit.cover,)),
                 Container(
                   alignment: Alignment.centerLeft,
                   child: Text(" 1. Sila klik ikon + untuk tambah tugasan kepada road gang. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14)),
                 ),
                 SizedBox(height: 15.0,),
                 SizedBox(child: Container(margin: EdgeInsets.only(right: 70),child: Image.asset("assets/2.png", height: 370, width: 250, fit: BoxFit.cover,))),
                 Container(
                   alignment: Alignment.centerLeft,
                   child:Text(" 2. Tarikh ini akan dijana secara automatik", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14)),
                 ),
                 Container(
                   color: Colors.white70,
                   alignment: Alignment.centerLeft,
                   child: Column(
                     children: [
                       Text(" 3. Sila pilih tiga jenis sumber aduan sama ada SISTEM ADUAN MBPJ, SISTEM ADUAN WAZE atau SISTEM ADUAN UTILITI. Sumber aduan ini wajib diisi. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                       Text(" 4. Sila isi nombor aduan berdasarkan jenis sumber aduan. Nombor aduan ini wajib diisi.", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                       Text(" 5. Sila  pilih lokasi kawasan tugasan sama ada PJS 1, PJS 2 dan sebagainya. Lokasi ini wajib diisi. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                       Text(" 6. Selepas pilih kawasan tugasan, sila pilih nama jalan kawasan tersebut.  Nama jalan ini wajib diisi. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                     ],
                   ),
                 ),
                 SizedBox(height: 15.0,),
                 SizedBox(child: Image.asset("assets/2(1).png", height: 370, width: 320, fit: BoxFit.cover,)),
                 Container(
                   alignment: Alignment.topCenter,
                   child: Column(
                     children: [
                       Text(" 7. Sila pilih kategori tugasan tersebut sama ada SEGERA atau PENAMBAIAKN BIASA. Kategori ini wajib diisi. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                       Text(" 8. Sila isi kerosakan tugasan tersebut. Kerosakan ni wajib diisi. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                       Text(" 9. Selepas itu, sila muat naik gambar aduan tersebut sebagai rujukan kepada road gang untuk melaksanakan tugasan tersebut. Muat naik gambar ini wajib dimuat naik.", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                       Text(" 10. Akhir sekali, sila klik butang SIMPAN untuk diberikan kepada penyelia supaya mendapat pengesahan daripada penyelia. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                     ],
                   ),
                 ),
               ],
             )
           ),
         ),
       ),
     );
  }
}
