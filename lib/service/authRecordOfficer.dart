import 'package:fyp/model/RecordOfficer.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'database.dart';

class AuthRecordOfficer{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  RecordOfficer _user;
  RecordOfficer get currentRecordOfficer => _user;

  // create user object based on firebaseUser (Supervisor)
  RecordOfficer _record(FirebaseUser user) {
    return user != null ? RecordOfficer(uid: user.uid) : null;
  }

  Stream<RecordOfficer> get recordOfficer{
    return _firebaseAuth.onAuthStateChanged.map( _record);
  }

  Future signInRecordOfficer(String email, String icnumber) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: icnumber);
      FirebaseUser user = result.user;
      return _record(user);
    }
    catch (e) {
      print(e.toString());
    }
  }

  Future registerRecordOfficer(String name, String email, String icnumber, String nophone, String zon, String pegawaiZon) async{
    try{
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: icnumber);
      FirebaseUser user = result.user;

      _user = RecordOfficer (
          uid: user.uid,
          name: name,
          email: email,
          nophone: nophone,
          icnumber: icnumber,
           zon:zon,
        pegawaiZon: pegawaiZon
      );

      await DatabaseService().addRecordOfficer(_user);
      return _record(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }


  //sign out
  Future signOut() async{
    try{
      return await _firebaseAuth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }
}
