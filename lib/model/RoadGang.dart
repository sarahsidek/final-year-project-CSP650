
class RoadGang{
  final String uid;
  final String username;
  final String password;

  RoadGang({this.uid, this.username, this.password});

  RoadGang.fromData(Map<String , dynamic> data)
   : uid = data['uid'],
     username = data['username'],
     password = data['password'];

  Map<String, dynamic> toJson(){
    return {
      'uid': uid,
       'username': username,
      'password': password
    };
  }
}