import 'package:cloud_firestore/cloud_firestore.dart';



class LocationTask{

  final String docId;
  final String email;
  final GeoPoint position;
  final String address;
  final DateTime dateTime;
  final String noAduan;
  final String kategori;
  final String landmark;
  final String progress;
  final String taskID;


  LocationTask({this.taskID,this.progress, this.landmark,this.noAduan, this.kategori, this.dateTime, this.email, this.position, this.address, this.docId});

  LocationTask.fromData(Map<String, dynamic> data, )
      : position = data['position'],
        email = data['email'],
        docId = data['docId'],
        dateTime = data['date'],
        address = data['address'],
        noAduan = data['noAduan'],
        landmark = data['landmark'],
        progress = data['progress'],
        taskID = data['taskID'],
        kategori =data['kategori'];

   Map<String, dynamic> toJson(){
     return{
       'email': email,
       'docId': docId,
       'position': position,
       'address': address,
       'date': dateTime,
       'noAduan': noAduan,
       'kategori':kategori,
        'landmark':landmark,
       'progress': progress,
       'taskID': taskID
     };
   }

}