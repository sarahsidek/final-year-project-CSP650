import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fyp/shared/Loading.dart';


class ListOfTaskApprove extends StatefulWidget {
  @override
  _ListOfTaskApproveState createState() => _ListOfTaskApproveState();
}
final FirebaseAuth auth = FirebaseAuth.instance;

Stream<QuerySnapshot> getUserRd1(BuildContext context) async* {
  final FirebaseUser rd = await auth.currentUser();
  yield* Firestore.instance.collection("Road Gang").where('uid',isEqualTo: rd.email).snapshots();
}

class _ListOfTaskApproveState extends State<ListOfTaskApprove> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  String email;
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Senarai Aduan telah Diluluskan"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: StreamBuilder(
            stream: Firestore.instance.collection("Task").where('verified', isEqualTo:'Sah').snapshots(),
            builder: (context, snapshot){
              if (snapshot.hasError || !snapshot.hasData) {
                return Loading();
              } else{
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index){
                      final List<DocumentSnapshot> tk = snapshot.data.documents;
                      _listOfImages =[];
                      for(int i =0; i <snapshot.data.documents[index].data['url'].length; i++){
                        _listOfImages.add(NetworkImage(snapshot.data.documents[index].data['url'][i]));
                      }
                      return Card(
                          child:ListTile(
                            title: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(tk[index].data['sumberAduan']),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(tk[index].data['noAduan']),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(tk[index].data['kategori']),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(tk[index].data['verified']),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10.0),
                                        height: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                        child: Carousel(
                                          boxFit: BoxFit.cover,
                                          images: _listOfImages,
                                          autoplay: false,
                                          indicatorBgPadding: 5.0,
                                          dotPosition: DotPosition.bottomCenter,
                                          animationCurve: Curves.fastLinearToSlowEaseIn,
                                          animationDuration: Duration(milliseconds: 2000),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                              subtitle: Container(
                                child: Row(
                                  children: [
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Text(tk[index].data['comments']),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {getListRoadGang(tk[index].data['id']);}
                          )
                      );
                    });
              }
            }),
      ),
    );
  }
  void getListRoadGang(String id){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.only(
        topLeft: const Radius.circular(10.0),
        topRight: const Radius.circular(10.0)
       )
    ),
        context: context,
        builder: (builder){
          return StreamBuilder<QuerySnapshot>(
          stream:Firestore.instance.collection("Road Gang").snapshots(),
               builder: (context,snapshot) {
                 if (!snapshot.hasData) {
                   return Loading();
                 } else {
                   return Column(
                     children: [
                       Container(
                         height: 100,
                         padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                         child: DropdownButtonFormField(
                           hint: Text("Senarai nama road gang"),
                           decoration: InputDecoration(
                               prefixIcon: Icon(Icons.add),
                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                           ),
                           isExpanded: true,
                           value: email,
                           onChanged: (value) {
                             setState(() {
                               email = value;
                             });
                           },
                           items: snapshot.data.documents.map((DocumentSnapshot document){
                             return new DropdownMenuItem<String>(
                               value: document.data['email'],
                               child: Text(document.data['email'])
                              );
                             }
                           ).toList(),
                         ),
                       ),
                       RaisedButton(
                           color: Colors.redAccent,
                           textColor: Colors.black,
                           child: Text("Hantar"),
                           onPressed: () async {
                             Firestore.instance.collection('Task').document(id).updateData({
                               'emailRoadGang': email
                             }).whenComplete((){
                               Navigator.pop(context);
                             });
                           }
                       ),
                     ],
                   );

                 }
             }
        );
     }
    );
  }
}

