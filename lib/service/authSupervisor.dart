import 'package:fyp/model/NewUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';

class AuthSupervisor{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  NewUser _user;
  NewUser get currentSupervisor => _user;


  // create user object based on firebaseUser (Supervisor)
  NewUser _newUser(FirebaseUser user) {
    return user != null ? NewUser(uid: user.uid) : null;
  }

  Stream<NewUser> get supervisor{
    return _firebaseAuth.onAuthStateChanged.map(_newUser);
  }


  Future signInSupervisor(String email, String uniqueID) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: uniqueID);
      FirebaseUser user = result.user;
      return _newUser(user);
    }
    catch (e) {
      print(e.toString());
    }
  }

  Future registerSupervisor(String name, String email, String uniqueID, String nophone) async{
    try{
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: uniqueID);
      FirebaseUser user = result.user;

      _user = NewUser (
          uid: user.uid,
          name: name,
          email: email,
          nophone: nophone,
          uniqueID: uniqueID
      );

      await DatabaseService().addSupervisor(_user);
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
