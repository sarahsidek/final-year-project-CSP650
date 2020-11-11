import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp/model/Admin.dart';
import 'package:fyp/service/database.dart';





class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
   Admin _admin;
   Admin get currentUser => _admin;


   //create user object based on firebaseUser
    Admin _userFromFirebaseUser(FirebaseUser user) {
      return user != null ? Admin(id: user.uid) : null;
    }



    // auth change user stream
    Stream<Admin> get user{
      return _firebaseAuth.onAuthStateChanged.map(_userFromFirebaseUser);
    }


  // sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _firebaseAuth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }



    //sign in with email & password
    Future signInWithEmailAndPassword(String email, String password) async {
      try{
        AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);

      }
      catch (e) {
        print(e.toString());
      }
    }

    // register with email & password
    Future registerWithEmailandPassword(String name,String email, String password, String confrimpass, String nophone) async {
      try {
        AuthResult  result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;


        _admin = Admin(
          id: user.uid,
          name: name,
          email: email,
          password: password,
          confirmpass: confrimpass,
          nophone: nophone
        );

        await DatabaseService().createUser(_admin);
        print(_admin.id);

        return _userFromFirebaseUser(user);
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

