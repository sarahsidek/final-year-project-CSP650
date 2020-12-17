import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class EditTask extends StatefulWidget {
 final DocumentSnapshot da;

  const EditTask({Key key, this.da}) : super(key: key);

  @override
  _EditTaskState createState() => _EditTaskState(da);
}

class _EditTaskState extends State<EditTask> {
  DocumentSnapshot da;
  _EditTaskState(DocumentSnapshot da){
    this.da = da;
  }
 TextEditingController _noAduan;
 TextEditingController _sumberAduan;
 TextEditingController _kategori;
  DateTime myDateTime = DateTime.now();
 @override
 void initState(){
   super.initState();
   _noAduan = TextEditingController(text: widget.da.data['noAduan']);
   _sumberAduan =TextEditingController(text: widget.da.data['sumberAduan']);
   _kategori = TextEditingController(text: widget.da.data['kategori']);
   myDateTime = (da.data['date']).toDate();
    imageUrls = (NetworkImage(da.data['url'])) as List<NetworkImage>;
}

  List <String> sumber = <String> ['Sistem Aduan MBPJ', 'Sistem Aduan Waze', 'Sistem Aduan Utiliti'];
  List <String> kate = <String> ['Segera', 'Pembaikan Biasa'];
  String kategori;
  String sumberAduan;
  List<NetworkImage> imageUrls = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kemaskini Aduan"),
          backgroundColor: Colors.redAccent,
        ),
    body: Container(
      padding: const EdgeInsets.all(16.0),
      child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 10.0),
              TextFormField(
                decoration:InputDecoration(
                    hintText: myDateTime.toString(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                onChanged: (value){
                  setState(() {
                    myDateTime = value as DateTime;
                    print(myDateTime);
                  });
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration:InputDecoration(
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5))),
                controller: _noAduan,
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField(
                hint:Text(widget.da.data['sumberAduan']),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.perm_contact_calendar),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                isExpanded: true,
                value: sumberAduan,
                onChanged: (newValue) {
                  setState(() {
                    sumberAduan = newValue;
                    _sumberAduan.text = sumberAduan;
                  });
                },
                items: sumber.map((sum){
                  return DropdownMenuItem(
                    value: sum,
                    child: new Text(sum),
                  );
                }).toList(),
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField(
                hint:Text(widget.da.data['kategori']),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.perm_contact_calendar),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                isExpanded: true,
                value: kategori,
                onChanged: (newValue) {
                  setState(() {
                    kategori = newValue;
                    _kategori.text = kategori;
                  });
                },
                items: kate.map((ka){
                  return DropdownMenuItem(
                    value: ka,
                    child: new Text(ka),
                  );
                }).toList(),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  images: imageUrls,
                  autoplay: false,
                  indicatorBgPadding: 5.0,
                  dotPosition: DotPosition.bottomCenter,
                  animationCurve: Curves.fastLinearToSlowEaseIn,
                  animationDuration: Duration(milliseconds: 2000),
                ),
              )
              ]
          )
      ),
    )
    );
  }
}



