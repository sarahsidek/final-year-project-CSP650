import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/shared/Loading.dart';


class ListOfTaskNotAccepted extends StatefulWidget {
  @override
  _ListOfTaskNotAcceptedState createState() => _ListOfTaskNotAcceptedState();
}
final FirebaseAuth auth = FirebaseAuth.instance;
Stream<QuerySnapshot> getUser(BuildContext context) async* {
  final FirebaseUser rd = await auth.currentUser();
  yield* Firestore.instance.collection("Task").where('uid',isEqualTo: rd.uid).where("verified", isEqualTo: 'TidakSah').snapshots();
}
class _ListOfTaskNotAcceptedState extends State<ListOfTaskNotAccepted> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  String comments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Aduan Tidak Diterima"),
          backgroundColor: Colors.redAccent,
        ),
      body: Container(
      child: StreamBuilder(
          stream: getUser(context),
          builder: (context, snapshot){
            if (snapshot.hasError || !snapshot.hasData) {
              return Loading();
            } else{
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index){
                    final List<DocumentSnapshot> da = snapshot.data.documents;
                    _listOfImages =[];
                    for(int i =0; i <snapshot.data.documents[index].data['url'].length; i++){
                      _listOfImages.add(NetworkImage(snapshot.data.documents[index].data['url'][i]));
                    }
                    final d = snapshot.data.documents[index];
                    return Card(
                        child:ListTile(
                          title: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(da[index].data['sumberAduan']),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(da[index].data['noAduan']),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(da[index].data['kategori']),
                                ),
                                SizedBox(height: 5.0),
                                Container(alignment: Alignment.centerLeft,
                                  child: Text(da[index].data['verified']),
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
                                child: Text(da[index].data['comments']),
                              ),
                            ],
                          ),
                        ),
                        )
                    );
                  });
            }
          }),
       )
    );
  }
}
