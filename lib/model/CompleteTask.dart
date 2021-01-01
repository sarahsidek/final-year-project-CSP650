class CompleteTask{
  DateTime time;
  List<String> barang;
  List<String> CompeleteimageUrls;
  List<String> quantity;
  String noAduan;
  String catatan;
  String id;
  String verified;
  String email;
  String sumberAduan;
  String kategori;
  String kawasan;
  String jalan;

  CompleteTask({this.barang,
    this.kawasan, this.jalan, this.kategori, this.sumberAduan, this.email,this.verified,
    this.time, this.CompeleteimageUrls,  this.noAduan, this.id, this.catatan, this.quantity});

  CompleteTask.fromData(Map<String, dynamic> data)
  : time = data['time'],
    barang = data['barang'],
    quantity =data['quantity'],
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
         'barang': barang,
         'quantity': quantity,
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