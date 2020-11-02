class Admin{
  final String id;
  final String name;
  final String email;
  final String password;
  final String confirmpass;
  final String nophone;

  Admin({this.id,this.name, this.email, this.password,  this.confirmpass, this.nophone});

  Admin.fromData(Map<String, dynamic> data)
  : id = data['uid'],
  name = data['name'],
  email = data['email'],
  password = data['password'],
  confirmpass = data['confrimationPassword'],
  nophone = data['nophone'];

  //Lis<DocumentSnapshot> get documents => documents;

   Map<String,dynamic> toJson(){
     return{
       'uid' : id,
       'name' : name,
       'email' : email,
       'password' : password,
       'confirmationPassword' : confirmpass,
       'nophone' : nophone
     };
   }
}