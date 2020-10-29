import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp/model/Admin.dart';
import 'package:fyp/model/RecordOfficer.dart';
import 'package:fyp/model/NewUser.dart';




class DatabaseService{
  // collection reference
  final CollectionReference userCollection  = Firestore.instance.collection('Admin');
  final CollectionReference roadGangCollection  = Firestore.instance.collection('Road Gang');
  final CollectionReference recordOfficerCollection  = Firestore.instance.collection('RecordOfficer');
  final CollectionReference supervisorCollection  = Firestore.instance.collection('Supervisor');


  final String uid;
  final String id;
  final String name;
  final String email;
  final String password;
  final String confrimpass;
  final String nophone;
  final String gender;
  final String imageUrl;
  final String usertype;
  final String sumberAduan;
  final int noAduan;
  final String kerosakan;
  final String zon;
  final String pegawaiZon;
  final String kategori;
  final String uniqueID;
  //final FirebaseStorage _storage = FirebaseStorage(storageBucket: 'gs://finalyearproject-5c689.appspot.com');

  DatabaseService({this.id, this.uid,this.name,this.email,this.password,this.confrimpass,this.nophone, this.gender,
  this.imageUrl, this.usertype, this.uniqueID, this.sumberAduan, this.noAduan, this.kerosakan, this.zon, this.pegawaiZon, this.kategori});



  Future createUser (Admin admin) async {
    try{
      await userCollection.document(admin.id).setData(admin.toJson())
      .whenComplete(() {
        print("User created!");
      });
    } catch (e) {
      return e.message;
    }
  }

  bool isLoggedIn(){
    if(FirebaseAuth.instance.currentUser() != null){
      return true;
    } else {
      return false;
    }
  }


  // create user supervisor
  Future  addSupervisor(NewUser supervisor)async{
    
       if (isLoggedIn() !=null)
         return  supervisorCollection.document(supervisor.uid).setData(supervisor.toJson());
    }
    
    // create user record officer 
    Future addRecordOfficer(RecordOfficer recordOfficer) async {
       if (isLoggedIn() != null){
         return recordOfficerCollection.document(recordOfficer.uid).setData(recordOfficer.toJson())
             .whenComplete(() {
               print("User created!");
         });
       }
    }
    
    // create user road gang 
    Future addRoadGang(NewUser roadGang) async {
       if(isLoggedIn() != null){
         return roadGangCollection.document(roadGang.uid).setData(roadGang.toJson()).whenComplete(() {
           print("User Created!");
         });
       }
    }


    // read the supervisor
    Stream<List<NewUser>> getSupervisor(){
    return supervisorCollection.snapshots().map(
            (snapshot) => snapshot.documents.map(
                    (doc) => NewUser.fromData(doc.data),
            ).toList(),
        );
    }

  // read the road gang
  Stream<List<NewUser>> getRoadGang(){
    return roadGangCollection.snapshots().map(
          (snapshot) => snapshot.documents.map(
            (doc) => NewUser.fromData(doc.data),
      ).toList(),
    );
  }

  // read the road gang
  Stream<List<RecordOfficer>> getRecordOfficer(){
    return recordOfficerCollection.snapshots().map(
          (snapshot) => snapshot.documents.map(
            (doc) => RecordOfficer.fromData(doc.data),
      ).toList(),
    );
  }

  // update profile admin
 Future updateProfile(String name, String email, String nophone) async {
    return userCollection.document(uid).updateData({
      'name': name,
      'email': email,
      'nophone': nophone
    }).whenComplete((){
      print("Update Profile");
    });
 }


    // update data supervisor
    Future updateData(NewUser newUser) async {
        return supervisorCollection.document(newUser.uid).updateData(
            newUser.toJson()).whenComplete(() {
          print("Update success!");
        });
    }


     // update data road gang
    Future updateData1(NewUser newUser) async {
      return roadGangCollection.document(newUser.uid).updateData(
        newUser.toJson()).whenComplete(() {
      print("Update success!");
     });
    }

    // update data record officer
  Future updateData2(RecordOfficer recordOfficer) async {
    return recordOfficerCollection.document(recordOfficer.uid).updateData(
        recordOfficer.toJson()).whenComplete(() {
      print("Update success!");
    });
  }

    // delete supervisor
      Future deleteSupervisor(String uid) async {
      return supervisorCollection.document(uid).delete();
    }

  // delete road gang
  Future deleteRoadGang(String uid) async {
    return roadGangCollection.document(uid).delete();
  }

  // delete record officer
   Future deleteRecordOfficer(String uid) async {
      return recordOfficerCollection.document(uid).delete();
   }

  // get email, pegawai zon and zon data from record officer
   


}
   
    
