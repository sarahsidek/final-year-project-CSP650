

class NewUser{
  final String uid;
  final String name;
  final String email;
  final String icnumber;
  final String nophone;



  NewUser({this.uid, this.name, this.email,this.nophone, this.icnumber});

  NewUser.fromData(Map<String, dynamic> data)
     : uid = data['uid'],
        name = data['name'],
        email = data['email'],
        icnumber = data['icnumber'],
        nophone = data['nophone'];

     Map<String,dynamic> toJson(){
    return{
      'uid' :uid,
      'name':name,
      'email': email,
      'nophone': nophone,
      'icnumber':icnumber
    };
  }
}




