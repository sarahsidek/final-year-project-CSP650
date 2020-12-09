class CompleteTask{
  final DateTime time;
  final String  jenisPenambaikan;
  final List<String> CompeleteimageUrls;
  final String noAduan;
  final String id;
  final String progress;
  final String email;
  final String sumberAduan;
  final String kategori;
  final String kawasan;
  final String jalan;

  CompleteTask({this.kawasan, this.jalan, this.kategori, this.sumberAduan, this.email,this.progress,
    this.time, this.jenisPenambaikan, this.CompeleteimageUrls,  this.noAduan, this.id});

  CompleteTask.fromData(Map<String, dynamic> data)
  : time = data['time'],
    jenisPenambaikan = data['jenisPenambaikan'],
    CompeleteimageUrls = data['completeTask'],
    id = data['id'],
    noAduan = data['completeTask'],
    email = data['email'],
    kategori = data['kategori'],
    sumberAduan = data['sumberAduan'],
    progress = data['progress'],
    kawasan = data['kawasan'],
    jalan = data['jalan'];

    Map<String , dynamic>toJson(){
       return {
         'time': time,
         'jenisPenambaikan' : jenisPenambaikan,
         'completeTask': CompeleteimageUrls,
         'id': id,
         'noAduan': noAduan,
         'progress': progress,
         'email': email,
         'kategori': kategori,
         'sumberAduan': sumberAduan,
         'naJalan': jalan,
         'kawasan': kawasan
       };
    }
  }