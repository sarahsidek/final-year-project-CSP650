import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class UserManualRoadGang extends StatefulWidget {
  @override
  _UserManualRoadGangState createState() => _UserManualRoadGangState();
}

class _UserManualRoadGangState extends State<UserManualRoadGang> {
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
                    child:  Image.asset("assets/9.png", height: 370, width: 290, fit: BoxFit.cover,),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(" 1. Sila klik button ini untuk pergi ke halaman senarai tugasan penyelia ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                  SizedBox(height: 15.0,),
                  Container(
                    margin: EdgeInsets.only(left: 50, right: 60),
                    child:Image.asset("assets/10(1).png", height: 370, width: 290, fit: BoxFit.cover,),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(" 2. Sila klik salah satu senarai tugasan penyelia  ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Container(
                    margin: EdgeInsets.only(left: 58),
                    child:Image.asset("assets/10(2).png", height: 350, width: 300, fit: BoxFit.cover,),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(" 3. Sila pilih tarikh untuk melengkapkan tugasan ini. Tarikh ini jawab diisi.  ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                        Text(" 4. Sila pilih jenis penambaikan yang telah digunakan dalam pelaksanaan tugasan tersebut. Jenis penambaikan ini wajib diisi. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                        Text(" 5. Sila isi kuantiti jenis penambaikan yang telah digunakan dalam pelaksanaan tugasan tersebut. Kuantiti ini wajib diisi.  ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                        Text(" 6. Sekiranya ingin menambah jenis penambaikan dan kuantiti yang telah digunakan, sila klik TAMBAH ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                        Text(" 7. Sila muat naik gambar tugasan yang telah dilaksanakan oleh anda. Muat naik gambar ini wajib diisi. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Container(
                    margin: EdgeInsets.only(left: 58),
                    child:Image.asset("assets/11(1).png", height: 350, width: 300, fit: BoxFit.cover,),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(" 8. Selepas mengisi semua maklumat tugasan lengkap tersebut, sila klik SIMPAN untuk diberikan kepada penyelia untuk mendapatkan pengesahan.  ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                        Text(" 9. Anda diwajibkan klik DAPATKAN LOKASI ANDA untuk dipantau oleh penyelia dalam melaksanakan tugasan lengkap. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Container(
                    margin: EdgeInsets.only(left: 100),
                    child:Image.asset("assets/11(2).png", height: 380, width: 300, fit: BoxFit.cover,),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(" 10. Sila klik ikon tersebut untuk mendapatkan lokasi semasa anda. Sebelum itu, anda dikehendaki membuka peranti lokasi anda. ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                      ]
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child:Image.asset("assets/12(1).png", height: 450, width: 250, fit: BoxFit.cover,),
                  ),
                  Container(
                  margin: EdgeInsets.only(left: 40),
                    child: Column(
                        children: [
                          Text(" Ini adalah contoh alamat lokasi anda selepas anda membuka peranti lokasi anda ", style: GoogleFonts.andika(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 5,),
                        ]
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
