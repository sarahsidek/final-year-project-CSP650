class CompleteTask{
  final DateTime time;
  final String  coldmix;
  final String crusherRun;
  final String hotmix;
  final String pasir;
  final String catPutih;
  final String catKuning;
  final List<String> CompeleteimageUrls;
  final String noAduan;
  final String catatan;
  final String id;
  final String verified;
  final String email;
  final String sumberAduan;
  final String kategori;
  final String kawasan;
  final String jalan;

  CompleteTask({this.coldmix, this.crusherRun, this.hotmix, this.pasir, this.catPutih, this.catKuning,
    this.kawasan, this.jalan, this.kategori, this.sumberAduan, this.email,this.verified,
    this.time, this.CompeleteimageUrls,  this.noAduan, this.id, this.catatan});

  CompleteTask.fromData(Map<String, dynamic> data)
  : time = data['time'],
    coldmix = data['coldmix'],
    crusherRun = data['crusherRun'],
    hotmix = data['hotmix'],
    pasir = data['pasir'],
    catPutih = data['catPutih'],
    catKuning = data['catKuning'],
    CompeleteimageUrls = data['completeTask'],
    id = data['id'],
    noAduan = data['noAduan'],
    email = data['email'],
    kategori = data['kategori'],
    sumberAduan = data['sumberAduan'],
    verified = data['verified'],
    kawasan = data['kawasan'],
    catatan = data['catatan'],
    jalan = data['jalan'];

    Map<String , dynamic>toJson(){
       return {
         'time': time,
         'coldmix' : coldmix,
         'crusherRun': crusherRun,
         'hotmix': hotmix,
         'pasir': pasir,
         'catPutih': catPutih,
         'catKuning': catKuning,
         'completeTask': CompeleteimageUrls,
         'id': id,
         'noAduan': noAduan,
         'verified': verified,
         'email': email,
         'kategori': kategori,
         'sumberAduan': sumberAduan,
         'naJalan': jalan,
         'kawasan': kawasan,
         'catatan': catatan
       };
    }
  }