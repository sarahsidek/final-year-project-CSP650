import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class UsermanualSupervisor extends StatefulWidget {
  @override
  _UsermanualSupervisorState createState() => _UsermanualSupervisorState();
}

class _UsermanualSupervisorState extends State<UsermanualSupervisor> {
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
                    alignment: Alignment.centerLeft,
                    child: Text("PENGESAHAN TUGASAN UNTUK PEGAWAI MEREKOD ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                  ),
                  SizedBox(child: Container(margin:EdgeInsets.only(right: 50),child: Image.asset("assets/3.png", height:400, width: 310, fit: BoxFit.cover,))),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(" 1. Sila klik ikon ini untuk pergi ke halaman senarai semua tugasan  ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                  SizedBox(height: 15.0),
                  SizedBox(child: Container(margin: EdgeInsets.only(right: 60),child: Image.asset("assets/4(1).png", height: 400, width: 320, fit: BoxFit.cover,))),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(" 2. Sila klik salah satu senarai semua tugasan  ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  SizedBox(child: Container( margin: EdgeInsets.only(left: 50),child: Image.asset("assets/4(2).png", height: 400, width: 350, fit: BoxFit.cover,))),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(" 3. Sila pilih pengesahan tugasan tersebut sama ada SAH atau TIDAK SAH. Selepas membuat pengesahan tersebut, tugasan tersebut akan dihantar kepada pegawai merekod.", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  SizedBox(child: Image.asset("assets/5.png", height: 400, width: 320, fit: BoxFit.cover,)),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(" 4. Sekiranya anda pilih TIDAK SAH untuk pengesahan tugasan tersebut, anda dikehendaki memberi catatan tersebut diruang yang telah disediakan. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                        Text(" 5. Selepas itu, klik OK untuk diberikan kepada penyelia untuk membaiki tugasan tersebut.  ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("PENGESAHAN TUGASAN UNTUK ROAD GANG ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                  ),
                  SizedBox(child: Container(margin: EdgeInsets.only(right: 70),child: Image.asset("assets/6.png", height: 400, width: 310, fit: BoxFit.cover,))),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(" 1. Sila klik ikon ini untuk pergi ke halaman senarai tugasan lengkap ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  SizedBox(child: Container(margin: EdgeInsets.only(right: 40 ),child: Image.asset("assets/7(3).png", height: 400, width: 380, fit: BoxFit.cover,))),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(" 2. Sila klik ikon ini untuk melihat alamat semasa road gang selepas melengkapkan tugasan sebelum membuat pengesahan tugasan lengkap. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                        Text(" 3. Selepas tu, sila klik tugasan lengkap tersebut untuk membuat pengesahan ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  SizedBox(child: Image.asset("assets/7(2).png", height: 520, width: 320, fit: BoxFit.cover,)),
                  Container(
                      margin: EdgeInsets.only(left: 5, right: 35),
                      child: Text(" Ini adalah contoh gambar alamat semasa road gang ",  style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), )),
                  SizedBox(height: 15.0,),
                  SizedBox(child: Container(margin: EdgeInsets.only(right: 40),child: Image.asset("assets/8(2).png", height: 400, width: 320, fit: BoxFit.cover,))),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(" 4. Sila pilih pengesahan tugasan lengkap tersebut sama ada LENGKAP atau PENAMBAIKAN SEMULA ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  SizedBox(child: Container(margin: EdgeInsets.only(left: 40),child: Image.asset("assets/8(3).png", height: 400, width: 320, fit: BoxFit.cover,))),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(" 5. Sekiranya anda pilih PENAMBAIKAN SEMULA untuk pengesahan tugasan lengkap tersebut, anda dikehendaki memberi catatan tersebut diruang yang telah disediakan. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                        Text(" 6. Selepas itu, klik OK untuk diberikan kepada road gang untuk membaiki tugasan lengkap tersebut.  ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
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

