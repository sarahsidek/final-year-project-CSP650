

class Task {
  String noAduan;
  String sumberAduan;
  String kategori;
  List<String> imageUrls;
  String kawasan;
  String naJalan;
  DateTime dateTime;
  String verified;
  String email;
  String comments;
  String uid;
  String id;
  String kerosakan;



  Task({this.kerosakan, this.kawasan, this.naJalan,
    this.comments,this.noAduan, this.sumberAduan, this.kategori,
    this.dateTime, this.verified, this.email, this.uid, this.id, this.imageUrls});

  Task.fromData(Map<String, dynamic> data)
      : noAduan = data['noAduan'],
        kategori = data['kategori'],
        sumberAduan = data['sumberAduan'],
        dateTime = data['date'],
        kawasan = data['kawasan'],
        naJalan = data['naJalan'],
        verified = data['verified'],
        email = data['email'],
        uid = data['uid'],
        imageUrls = data['url'],
        comments = data['comments'],
        kerosakan = data['kerosakan'],
        id = data['id'];


    Map<String,dynamic> toJson(){
    return{
      'noAduan' : noAduan,
      'kategori' : kategori,
      'sumberAduan' : sumberAduan,
      'date' : dateTime,
      'verified': verified,
      'email': email,
      'uid': uid,
      'url':imageUrls,
      'id':id,
      'comments':comments,
      'kawasan': kawasan,
      'naJalan': naJalan,
      'kerosakan': kerosakan
    };
  }
}
