import 'package:cloud_firestore/cloud_firestore.dart';



class LocationTask{

   String docId;
   String completeTaskID;
   String email;
   GeoPoint position;
   String address;
   String noAduan;
   String kategori;
   List<String> quantity;
   List<String> barang;


  LocationTask({this.completeTaskID,this.quantity,this.barang, this.noAduan, this.kategori,this.email, this.position, this.address, this.docId});

  LocationTask.fromData(Map<String, dynamic> data)
      : completeTaskID = data['completeTaskID'],
        position = data['position'],
        email = data['email'],
        docId = data['docId'],
        address = data['address'],
        noAduan = data['noAduan'],
        quantity = data['quantity'],
        barang = data['barang'],
        kategori =data['kategori'];

   Map<String, dynamic> toJson(){
     return{
       'completeTaskID':completeTaskID,
       'email': email,
       'docId': docId,
       'position': position,
       'address': address,
       'noAduan': noAduan,
       'kategori':kategori,
       'quantity': quantity,
       'barang': barang
     };
   }

}