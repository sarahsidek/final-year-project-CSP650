class RecordOfficer {
  final String uid;
  final String name;
  final String email;
  final String nophone;
  final String zon;
  final String pegawaiZon;
  final String icnumber;


  RecordOfficer({this.uid, this.name, this.email,this.nophone, this.zon, this.pegawaiZon, this.icnumber});

  RecordOfficer.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        name = data['name'],
        email = data['email'],
        icnumber = data['icnumber'],
        nophone = data['nophone'],
        zon = data['zon'],
        pegawaiZon = data['pegawaiZon'];

  Map<String,dynamic> toJson(){
    return{
      'uid':uid,
      'name':name,
      'email': email,
      'nophone': nophone,
      'icnumber': icnumber,
      'zon': zon,
      'pegawaiZon': pegawaiZon
    };
  }
}