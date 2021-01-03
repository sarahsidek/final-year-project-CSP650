import 'package:fyp/model/Supervisor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';

class AuthSupervisor{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Supervisor _sv;
  Supervisor get currentSupervisor => _sv;


  // create user object based on firebaseUser (Supervisor)
  Supervisor _newUser(FirebaseUser user) {
    return user != null ? Supervisor(uid: user.uid) : null;
  }

  Stream<Supervisor> get supervisor{
    return _firebaseAuth.onAuthStateChanged.map(_newUser);
  }


  Future signInSupervisor(String email, String icnumber) async {

      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: icnumber);
      FirebaseUser user = result.user;
      return _newUser(user);
  }

  Future registerSupervisor(String name, String email, String icnumber, String nophone) async{
    try{
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: icnumber);
      FirebaseUser user = result.user;

      _sv = Supervisor (
          uid: user.uid,
          name: name,
          email: email,
          nophone: nophone,
          icnumber: icnumber
      );

      await DatabaseService().addSupervisor(_sv);
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
