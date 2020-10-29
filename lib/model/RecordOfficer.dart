class RecordOfficer {
  final String uid;
  final String name;
  final String email;
  final String uniqueID;
  final String nophone;
  final String zon;
  final String pegawaiZon;


  RecordOfficer({this.uid, this.name, this.email,this.nophone, this.uniqueID,this.zon, this.pegawaiZon});

  RecordOfficer.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        name = data['name'],
        email = data['email'],
        uniqueID = data['uniqueID'],
        nophone = data['nophone'],
        zon = data['zon'],
        pegawaiZon = data['pegawaiZon'];

  Map<String,dynamic> toJson(){
    return{
      'uid':uid,
      'name':name,
      'email': email,
      'nophone': nophone,
      'uniqueID': uniqueID,
      'zon': zon,
      'pegawaiZon': pegawaiZon
    };
  }
}