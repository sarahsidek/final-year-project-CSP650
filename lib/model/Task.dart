


class Task {
  final String noAduan;
  final String sumberAduan;
  final String kategori;
  final String urls;
  final DateTime dateTime;
  final String verified;
  final String email;
  final String uid;

  Task(this.noAduan, this.sumberAduan, this.kategori, this.urls, this.dateTime, this.verified, this.email, this.uid);

  Map<String,dynamic> toJson(){
    return{
      'noAduan' : noAduan,
      'kategori' : kategori,
      'sumberAduan' : sumberAduan,
      'date' : dateTime,
      'verified': verified
    };
  }
  Task.fromData(Map<String, dynamic> data)
      : noAduan = data['noAduan'],
        kategori = data['kategori'],
        sumberAduan = data['sumberAduan'],
        dateTime = data['date'],
        verified = data['verified'],
        email = data['email'],
        uid = data['uid'],
        urls = data['urls'];
}
