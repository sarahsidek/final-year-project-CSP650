

class NewUser{
  final String uid;
  final String name;
  final String email;
  final String uniqueID;
  final String nophone;



  NewUser({this.uid, this.name, this.email,this.nophone, this.uniqueID});

  NewUser.fromData(Map<String, dynamic> data)
     : uid = data['uid'],
        name = data['name'],
        email = data['email'],
        uniqueID = data['uniqueID'],
        nophone = data['nophone'];

     Map<String,dynamic> toJson(){
    return{
      'uid' :uid,
      'name':name,
      'email': email,
      'nophone': nophone,
      'uniqueID': uniqueID
    };
  }
}




