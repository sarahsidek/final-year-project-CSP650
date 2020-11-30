class CompleteTask{
  final DateTime time;
  final String  jenisPenambaikan;
  final List<String> CompeleteimageUrls;
  final String noAduan;
  final String id;

  CompleteTask({this.time, this.jenisPenambaikan, this.CompeleteimageUrls,  this.noAduan, this.id});

  CompleteTask.fromData(Map<String, dynamic> data)
  : time = data['time'],
    jenisPenambaikan = data['jenisPenambaikan'],
    CompeleteimageUrls = data['completeTask'],
    id = data['id'],
    noAduan = data['completeTask'];

    Map<String , dynamic>toJson(){
       return {
         'time': time,
         'jenisPenambaikan' : jenisPenambaikan,
         'completeTask': CompeleteimageUrls,
         'id': id,
         'noAduan': noAduan
       };
    }
  }