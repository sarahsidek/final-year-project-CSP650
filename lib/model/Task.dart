

class Task {
  final String noAduan;
  final String sumberAduan;
  final String kategori;
  final List<String> imageUrls;
  final DateTime dateTime;
  final String verified;
  final String email;
  final String comments;
  final String uid;
  final String id;
  final String landMark;
  final String progress;
  final String emailRoadgang;



  Task({this.emailRoadgang, this.progress, this.landMark,
    this.comments,this.noAduan, this.sumberAduan, this.kategori,
    this.dateTime, this.verified, this.email, this.uid, this.id, this.imageUrls});

  Task.fromData(Map<String, dynamic> data)
      : noAduan = data['noAduan'],
        kategori = data['kategori'],
        sumberAduan = data['sumberAduan'],
        dateTime = DateTime.parse(data['date'].toDate().toString()),
        verified = data['verified'],
        email = data['email'],
        uid = data['uid'],
        imageUrls = data['url'],
        comments = data['comments'],
        landMark = data['landmark'],
        progress = data['progress'],
        emailRoadgang = data['emailRoadGang'],
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
      'landmarks':landMark,
      'progress': progress,
      'emailRoadGang': emailRoadgang,
      'dateCompleteTask': dateTime,
    };
  }
}
