import 'package:fyp/model/RoadGang.dart';
import 'package:fyp/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRoadGang {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  RoadGang _rg;
  RoadGang get currentRoadGang => _rg;

  // create user object based on firebaseUser (Road Gang)
  RoadGang _newUser(FirebaseUser user) {
    return user != null ? RoadGang(uid: user.uid) : null;
  }


  Stream<RoadGang> get roadGang{
    return _firebaseAuth.onAuthStateChanged.map(_newUser);
  }


  Future signInRoadGang(String name, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: name, password: password);
      FirebaseUser user = result.user;
      return _newUser(user);
    }
    catch (e) {
      print(e.toString());
    }
  }

  Future registerRoadGang(String username, String password) async{
    try{
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: username, password: password);
      FirebaseUser user = result.user;

      _rg = RoadGang (
          uid: user.uid,
          username: username,
          password :password
      );

      await DatabaseService().addRoadGang(_rg);
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
