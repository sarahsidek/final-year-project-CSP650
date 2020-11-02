import 'package:fyp/model/NewUser.dart';
import 'package:fyp/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRoadGang {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  NewUser _user;
  NewUser get currentRoadGang => _user;

  // create user object based on firebaseUser (Supervisor)
  NewUser _newUser(FirebaseUser user) {
    return user != null ? NewUser(uid: user.uid) : null;
  }


  Stream<NewUser> get roadGang{
    return _firebaseAuth.onAuthStateChanged.map(_newUser);
  }


  Future signInRoadGang(String email, String icnumber) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: icnumber);
      FirebaseUser user = result.user;
      return _newUser(user);
    }
    catch (e) {
      print(e.toString());
    }
  }

  Future registerRoadGang(String name, String email, String icnumber, String nophone) async{
    try{
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: icnumber);
      FirebaseUser user = result.user;

      _user = NewUser (
          uid: user.uid,
          name: name,
          email: email,
          nophone: nophone,
          icnumber: icnumber
      );

      await DatabaseService().addRoadGang(_user);
      return _newUser(user);
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
