import 'package:cloud_firestore/cloud_firestore.dart';



class LocationTask{

  final String docId;
  final String email;
  final GeoPoint position;
  final String address;
  final String kawasan;
  final String naJalan;
  final String noAduan;
  final String kategori;


  LocationTask({this.kawasan,this.naJalan, this.noAduan, this.kategori,this.email, this.position, this.address, this.docId});

  LocationTask.fromData(Map<String, dynamic> data)
      : position = data['position'],
        email = data['email'],
        docId = data['docId'],
        address = data['address'],
        noAduan = data['noAduan'],
        naJalan = data['namaJalan'],
        kawasan = data['kawasan'],
        kategori =data['kategori'];

   Map<String, dynamic> toJson(){
     return{
       'email': email,
       'docId': docId,
       'position': position,
       'address': address,
       'noAduan': noAduan,
       'kategori':kategori,
       'kawasan': kawasan,
       'namaJalan': naJalan
     };
   }

}